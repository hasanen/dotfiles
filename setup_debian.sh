#!/bin/bash

if [ $1 ]; then
  sudo=sudo
fi

## 1Password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | $sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | $sudo tee /etc/apt/sources.list.d/1password.list
$sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | $sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
$sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | $sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

## Visual Studio Code 
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
$sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | $sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null


$sudo apt-get update
$sudo apt-get install -y ffmpeg \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev \
  ansible \
  git \
  p7zip \
  silversearcher-ag \
  tmux \
  tree \
  wget \
  curl \
  zsh \
  mosh \
  screenfetch \
  vlc \
  build-essential \
  flatpak \
  syncthing \ 
  xfce4-whiskermenu-plugin \
  1password \
  code \
  fprintd \
  libpam-fprintd


curl -sS https://starship.rs/install.sh | sh


## Flatpak 
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.discordapp.Discord
