#!/bin/bash

if [ $1 ]; then
  sudo=sudo
fi


curl -fsSL https://download.docker.com/linux/debian/gpg | $sudo apt-key add -
echo 'deb https://download.docker.com/linux/debian stretch stable' > /etc/apt/sources.list.d/docker.list
$sudo apt-get update
$sudo apt-get install -y ffmpeg \
  ansible \
  git \
  p7zip \
  silversearcher-ag \
  tmux \
  tree \
  wget \
  youtube-dl \
  zsh \
  mosh \
  screenfetch \
  vlc \
  docker-ce \
  libavcodec-extra-53


