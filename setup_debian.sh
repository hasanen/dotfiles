#!/bin/bash

if [ $1 ]; then
  sudo=sudo
fi


curl -fsSL https://download.docker.com/linux/debian/gpg | $sudo apt-key add -
$sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
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
  docker-ce


