#!/bin/zsh
#
run_scripts () {
  for script in $1/*; do
    [[ -s $script ]] && [[ -x $script ]] && . $script
  done
}

SCRIPTS_PATH=$HOME/.zshrc.d
run_scripts $SCRIPTS_PATH
