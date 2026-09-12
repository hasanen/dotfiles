#!/bin/bash

set -eu

if [ "${1:-}" != "--reset-ssh-host-keys" ]; then
  echo "Kali SSH host keys are left untouched by default."
  echo "To reset the host identity and regenerate OpenSSH keys, run:"
  echo "  $0 --reset-ssh-host-keys"
  echo "This will change the machine's SSH fingerprint and clients will need to trust the new host key."
  exit 0
fi

echo "WARNING: resetting SSH host keys changes this machine's SSH identity."
echo "Existing host keys will be backed up before they are removed."
read -r -p "Type 'RESET SSH HOST KEYS' to confirm: " confirmation
if [ "$confirmation" != "RESET SSH HOST KEYS" ]; then
  echo "Aborted; no SSH host keys were removed."
  exit 1
fi

backup_dir="/etc/ssh/host-key-backup-$(date +%Y%m%d-%H%M%S)"
sudo mkdir -p "$backup_dir"
if compgen -G '/etc/ssh/ssh_host_*' > /dev/null; then
  sudo cp -a /etc/ssh/ssh_host_* "$backup_dir/"
fi
sudo rm -f /etc/ssh/ssh_host_*
sudo dpkg-reconfigure openssh-server
curl -sS https://starship.rs/install.sh | sh
