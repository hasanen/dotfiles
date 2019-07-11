#!/bin/bash

echo "=== STARTING THE SETUP ==="

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=linux;;
    Darwin*)    machine=mac;;
esac

if [ $machine = "mac" ]; then
  echo "--- SETTING UP MAC ---"
  ~/dotfiles/setup_macos.sh $1
  echo "--- MAC SETUP DONE ---"
fi

if [ $machine = "linux" ]; then
  echo "--- SETTING UP LINUX ---"
  ~/dotfiles/setup_debian.sh $1
  echo "--- LINUX SETUP DONE ---"
fi
if [[ $(uname -a) =~ "kali" ]]; then
  echo "--- SETTING UP KALI ---"
  ~/dotfiles/setup_kali.sh $1
  echo "--- KALI SETUP DONE ---"
fi

~/dotfiles/setup_common.sh

chsh -s /bin/zsh
echo "=== SETUP DONE ==="
echo "Log out and back in to apply all the settings"
