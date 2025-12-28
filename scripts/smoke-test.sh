#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${root_dir}"

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker is required." >&2
  exit 1
fi

if [[ ! -f ".env" ]]; then
  echo "Missing .env. Run scripts/setup.sh first." >&2
  exit 1
fi

set -a
# shellcheck disable=SC1091
source ".env"
set +a

if [[ -z "${MARIADB_ROOT_PASSWORD:-}" ]]; then
  echo "MARIADB_ROOT_PASSWORD is not set in .env." >&2
  exit 1
fi

db_exec() {
  docker compose exec -T db mariadb -uroot -p"${MARIADB_ROOT_PASSWORD}" -e "$1"
}

running_services="$(docker compose ps --services --filter status=running)"
if command -v rg >/dev/null 2>&1; then
  service_matcher=(rg -q)
else
  service_matcher=(grep -q)
fi

for svc in db rockserv2_fuzzem; do
  if ! printf '%s\n' "${running_services}" | "${service_matcher[@]}" "^${svc}$"; then
    echo "Service not running: ${svc}" >&2
    exit 1
  fi
done

start_ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
docker compose restart rockserv2_fuzzem >/dev/null

container_id="$(docker compose ps -q rockserv2_fuzzem)"
if [[ -z "${container_id}" ]]; then
  echo "Could not resolve rockserv2_fuzzem container id." >&2
  exit 1
fi

health_status=""
for _ in {1..30}; do
  health_status="$(docker inspect -f '{{if .State.Health}}{{.State.Health.Status}}{{else}}none{{end}}' "${container_id}")"
  if [[ "${health_status}" == "healthy" ]]; then
    break
  fi
  sleep 2
done

if [[ "${health_status}" != "healthy" ]]; then
  echo "rockserv2_fuzzem did not reach healthy state (status: ${health_status})." >&2
  exit 1
fi

tcp_check() {
  local host="$1"
  local port="$2"
  if command -v nc >/dev/null 2>&1; then
    nc -z -w 2 "${host}" "${port}" >/dev/null 2>&1
    return $?
  fi
  if command -v timeout >/dev/null 2>&1; then
    timeout 2 bash -c "</dev/tcp/${host}/${port}" >/dev/null 2>&1
    return $?
  fi
  bash -c "</dev/tcp/${host}/${port}" >/dev/null 2>&1
}

if ! tcp_check localhost 4040; then
  echo "Port 4040 (fuzzem game) is not reachable." >&2
  exit 1
fi

if ! tcp_check localhost 2332; then
  echo "Port 2332 (fuzzem talker) is not reachable." >&2
  exit 1
fi

echo "Smoke test passed."
