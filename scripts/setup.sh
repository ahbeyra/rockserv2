#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker is required. Install Docker Engine + Compose first." >&2
  exit 1
fi

cd "${root_dir}"

if [[ ! -f ".env" ]]; then
  cat > .env <<'EOF'
MARIADB_ROOT_PASSWORD=rockserv_root
ROCKSERV_DB_USER=rockserv
ROCKSERV_DB_PASS=change_me
EOF
  echo "Created .env with default credentials. Update these before production use."
fi

mkdir -p \
  data/dillfrog/userinfo \
  data/dillfrog/saved \
  data/fuzzem/userinfo \
  data/fuzzem/saved \
  data/php-sessions

chmod 0777 data/php-sessions

mode="${1:-web}"
compose_with_retry() {
  local attempts=3
  local delay=5
  local i
  for ((i=1; i<=attempts; i++)); do
    if docker compose "$@"; then
      return 0
    fi
    echo "Docker compose failed (attempt ${i}/${attempts}). Retrying..." >&2
    sleep "${delay}"
  done
  return 1
}

case "${mode}" in
  web)
    compose_with_retry -f docker-compose.yml -f docker-compose.web.yml up -d --build
    ;;
  core)
    compose_with_retry up -d --build
    ;;
  *)
    echo "Usage: scripts/setup.sh [web|core]" >&2
    exit 1
    ;;
esac
