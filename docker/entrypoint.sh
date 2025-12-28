#!/usr/bin/env bash
set -euo pipefail

game="${ROCKSERV_GAME:-dillfrog}"
case "$game" in
  dillfrog|fuzzem) ;;
  *)
    echo "ROCKSERV_GAME must be dillfrog or fuzzem (got: ${game})" >&2
    exit 1
    ;;
esac

export ROCKSERV_DB_HOST="${ROCKSERV_DB_HOST:-db}"
export ROCKSERV_DB_USER="${ROCKSERV_DB_USER:-rockserv}"
export ROCKSERV_DB_PASS="${ROCKSERV_DB_PASS:-change_me}"
export ROCKSERV_DB_DRIVER="${ROCKSERV_DB_DRIVER:-mariadb}"
export ROCKSERV_DB_PORT="${ROCKSERV_DB_PORT:-}"
export ROCKSERV_AUTOCLEANUP="${ROCKSERV_AUTOCLEANUP:-1}"
export ROCKSERV_HEARTBEAT="${ROCKSERV_HEARTBEAT:-1}"
export ROCKSERV_HEARTBEAT_INTERVAL="${ROCKSERV_HEARTBEAT_INTERVAL:-30}"
export ROCKSERV_HEARTBEAT_TTL="${ROCKSERV_HEARTBEAT_TTL:-120}"
export ROCKSERV_RESTART_NOTICE="${ROCKSERV_RESTART_NOTICE:-1}"
export ROCKSERV_WATCHDOG="${ROCKSERV_WATCHDOG:-1}"
export ROCKSERV_TALKER="${ROCKSERV_TALKER:-0}"
export ROCKSERV_TALKER_HOST="${ROCKSERV_TALKER_HOST:-localhost}"
export ROCKSERV_TALKER_PORT="${ROCKSERV_TALKER_PORT:-2332}"

if [[ -z "${ROCKSERV_DB_NAME:-}" ]]; then
  if [[ "$game" == "dillfrog" ]]; then
    export ROCKSERV_DB_NAME="r2_dillfrog"
  else
    export ROCKSERV_DB_NAME="r2_fuzzem"
  fi
fi

data_dir="/app/${game}/src"
mkdir -p "${data_dir}/userinfo" "${data_dir}/saved"

export ROCKSERV_BASE_CODE_DIR="${ROCKSERV_BASE_CODE_DIR:-${data_dir}}"
export ROCKSERV_HEARTBEAT_FILE="${ROCKSERV_HEARTBEAT_FILE:-${data_dir}/heartbeat.txt}"
export ROCKSERV_RESTART_NOTICE_FILE="${ROCKSERV_RESTART_NOTICE_FILE:-${data_dir}/restart_notice.txt}"
if [[ "${ROCKSERV_HEARTBEAT}" == "0" ]]; then
  export ROCKSERV_WATCHDOG="0"
fi

web_dir="${ROCKSERV_BASE_WEB_DIR:-/var/www/html/games/rs2}"
mkdir -p "${web_dir}/help/courses"
if [[ ! -f "${web_dir}/help/courses/index.shtml" ]]; then
  cat > "${web_dir}/help/courses/index.shtml" <<'EOF'
<html><body><pre>Course help has not been generated yet.</pre></body></html>
EOF
fi

wait_for_db() {
  local dsn
  local driver
  driver="$(echo "${ROCKSERV_DB_DRIVER:-mariadb}" | tr '[:upper:]' '[:lower:]')"
  if [[ "${driver}" == "pg" || "${driver}" == "postgres" || "${driver}" == "postgresql" ]]; then
    dsn="DBI:Pg:dbname=${ROCKSERV_DB_NAME};host=${ROCKSERV_DB_HOST}"
    if [[ -n "${ROCKSERV_DB_PORT}" ]]; then
      dsn="${dsn};port=${ROCKSERV_DB_PORT}"
    fi
  else
    dsn="DBI:MariaDB:database=${ROCKSERV_DB_NAME};host=${ROCKSERV_DB_HOST}"
    if [[ -n "${ROCKSERV_DB_PORT}" ]]; then
      dsn="${dsn};port=${ROCKSERV_DB_PORT}"
    fi
  fi

  export ROCKSERV_DB_DSN="${dsn}"
  local attempts=30
  local delay=2
  local i
  for ((i=1; i<=attempts; i++)); do
    if perl -MDBI -e 'DBI->connect($ENV{ROCKSERV_DB_DSN}, $ENV{ROCKSERV_DB_USER}, $ENV{ROCKSERV_DB_PASS}, {RaiseError=>1, AutoCommit=>1})->disconnect;' >/dev/null 2>&1; then
      return 0
    fi
    echo "Waiting for DB (${i}/${attempts})..." >&2
    sleep "${delay}"
  done
  echo "Database not reachable after ${attempts} attempts." >&2
  return 1
}

if [[ "${ROCKSERV_RESTART_NOTICE}" != "0" ]]; then
  ts="$(date -u +'%Y-%m-%d %H:%M UTC')"
  cat > "${ROCKSERV_RESTART_NOTICE_FILE}" <<EOF
{13}*** {16}Server restart: {7}${ts}{13}. {16}If you were disconnected, please log in again.
EOF
fi

export PERL5LIB="${data_dir}:${PERL5LIB:-}"

cd "${data_dir}"

wait_for_db

child_pid=""
watchdog_pid=""

terminate() {
  if [[ -n "${watchdog_pid}" ]]; then
    kill "${watchdog_pid}" 2>/dev/null || true
    wait "${watchdog_pid}" 2>/dev/null || true
  fi
  if [[ -n "${child_pid}" ]]; then
    kill -TERM "${child_pid}" 2>/dev/null || true
    wait "${child_pid}" 2>/dev/null || true
  fi
  exit 0
}

trap terminate INT TERM

watchdog_loop() {
  local start_time now mtime interval ttl file
  start_time="$(date +%s)"
  ttl="${ROCKSERV_HEARTBEAT_TTL:-120}"
  interval="${ROCKSERV_WATCHDOG_INTERVAL:-${ROCKSERV_HEARTBEAT_INTERVAL:-30}}"
  file="${ROCKSERV_HEARTBEAT_FILE}"
  if [[ ! "${ttl}" =~ ^[0-9]+$ ]]; then
    ttl=120
  fi
  if [[ ! "${interval}" =~ ^[0-9]+$ ]]; then
    interval=30
  fi
  if [[ "${interval}" -lt 5 ]]; then
    interval=5
  fi

  while true; do
    if ! kill -0 "${child_pid}" 2>/dev/null; then
      exit 0
    fi

    now="$(date +%s)"
    if [[ -f "${file}" ]]; then
      mtime="$(stat -c %Y "${file}" 2>/dev/null || echo 0)"
      if (( now - mtime > ttl )); then
        echo "watchdog: heartbeat stale, restarting" >&2
        kill -TERM "${child_pid}" 2>/dev/null || true
        exit 0
      fi
    else
      if (( now - start_time > ttl )); then
        echo "watchdog: heartbeat missing, restarting" >&2
        kill -TERM "${child_pid}" 2>/dev/null || true
        exit 0
      fi
    fi
    sleep "${interval}"
  done
}

perl rockserv2.pl &
child_pid="$!"

if [[ "${ROCKSERV_WATCHDOG}" != "0" ]]; then
  watchdog_loop &
  watchdog_pid="$!"
fi

if wait "${child_pid}"; then
  exit_code=0
else
  exit_code="$?"
fi

if [[ -n "${watchdog_pid}" ]]; then
  kill "${watchdog_pid}" 2>/dev/null || true
  wait "${watchdog_pid}" 2>/dev/null || true
fi

exit "${exit_code}"
