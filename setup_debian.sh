#!/bin/bash

if [ $1 ]; then
  sudo=sudo
fi


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
  vlc

curl -sS https://starship.rs/install.sh | sh
