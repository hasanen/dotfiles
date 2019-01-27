#!/bin/bash

if [ $1 ]; then
  sudo=sudo
fi

pip install --upgrade pwntools
