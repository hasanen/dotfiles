#!/bin/bash

set -euo pipefail

REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
export REPO_ROOT

echo "=== STARTING THE SETUP ==="

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=linux;;
    Darwin*)    machine=mac;;
esac

if [ "$machine" = "mac" ]; then
  echo "--- SETTING UP MAC ---"
  "$REPO_ROOT/setup_macos.sh" "$@"
  echo "--- MAC SETUP DONE ---"
fi

if [ "$machine" = "linux" ]; then
  echo "--- SETTING UP LINUX ---"
  "$REPO_ROOT/setup_debian.sh" "$@"
  echo "--- LINUX SETUP DONE ---"
fi
if [[ $(uname -a) =~ "kali" ]]; then
  echo "--- SETTING UP KALI ---"
  "$REPO_ROOT/setup_kali.sh" "$@"
  echo "--- KALI SETUP DONE ---"
fi

"$REPO_ROOT/setup_common.sh"

chsh -s /bin/zsh
echo "=== SETUP DONE ==="
echo "Log out and back in to apply all the settings"
