DEBIAN_PREVENT_KEYBOARD_CHANGES=yes
export TERMINAL=guake
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export EDITOR=vim
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export GPG_TTY=$(tty)

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
export PYENV_SHELL=zsh
source "$PYENV_ROOT/completions/pyenv.zsh"
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}

export NVM_DIR="$HOME/.nvm"

# Heroku 
export PATH="/usr/local/heroku/bin:$PATH"
#
# My own scripts
export PATH=$HOME/bin:$PATH

#Locales
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

#QMK
export QMK_HOME='~/code/qmk/qmk_firmware'

source $HOME/.cargo/env
#source $HOME/.rsvm/current/cargo/env
