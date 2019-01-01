#!/bin/bash

if [ $1 ]; then
  sudo=sudo
fi

echo "Installing software"
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

pip install --upgrade pwntools

mkdir ~/tools
git clone https://github.com/ffuf/ffuf.git ~/tools/ffuf

