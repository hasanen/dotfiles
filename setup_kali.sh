#!/bin/bash

if [ $1 ]; then
  sudo=sudo
fi

$sudo apt-get install -y seclists
pip install --upgrade pwntools

$sudo rm /etc/ssh/ssh_host_*
$sudo dpkg-reconfigure openssh-server
