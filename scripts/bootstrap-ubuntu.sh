#!/usr/bin/env bash
set -euo pipefail

if [[ "${EUID}" -ne 0 ]]; then
  if command -v sudo >/dev/null 2>&1; then
    exec sudo -E bash "$0" "$@"
  fi
  echo "Run as root or install sudo." >&2
  exit 1
fi

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v apt-get >/dev/null 2>&1; then
  echo "This script expects Ubuntu with apt-get." >&2
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

apt_update() {
  local attempts=3
  local delay=5
  local i
  for ((i=1; i<=attempts; i++)); do
    if apt-get update; then
      return 0
    fi
    echo "apt-get update failed (attempt ${i}/${attempts}). Retrying..." >&2
    sleep "${delay}"
  done
  return 1
}

apt_install() {
  local attempts=3
  local delay=5
  local i
  for ((i=1; i<=attempts; i++)); do
    if apt-get install -y "$@"; then
      return 0
    fi
    echo "apt-get install failed (attempt ${i}/${attempts}). Attempting recovery..." >&2
    dpkg --configure -a || true
    apt-get -f install -y || true
    sleep "${delay}"
  done
  return 1
}

apt_update
apt_install ca-certificates curl gnupg lsb-release git

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

arch="$(dpkg --print-architecture)"
codename="$(. /etc/os-release && echo "${VERSION_CODENAME}")"
echo "deb [arch=${arch} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu ${codename} stable" \
  > /etc/apt/sources.list.d/docker.list

apt_update
apt_install docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable --now docker

cd "${root_dir}"
./scripts/setup.sh web
