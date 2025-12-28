#!/usr/bin/env bash
set -euo pipefail

game="${ROCKSERV_GAME:-dillfrog}"
base_dir="${ROCKSERV_BASE_CODE_DIR:-/app/${game}/src}"
heartbeat_file="${ROCKSERV_HEARTBEAT_FILE:-${base_dir}/heartbeat.txt}"
ttl="${ROCKSERV_HEARTBEAT_TTL:-120}"

if [[ "${ROCKSERV_HEARTBEAT:-1}" == "0" ]]; then
  exit 0
fi

if [[ ! "${ttl}" =~ ^[0-9]+$ ]]; then
  ttl=120
fi

if [[ ! -f "${heartbeat_file}" ]]; then
  echo "heartbeat missing" >&2
  exit 1
fi

now="$(date +%s)"
mtime="$(stat -c %Y "${heartbeat_file}")"
if (( now - mtime > ttl )); then
  echo "heartbeat stale" >&2
  exit 1
fi

exit 0
