DEBIAN_PREVENT_KEYBOARD_CHANGES=yes
export TERMINAL=guake
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export EDITOR=vim

if [[ -d "$HOME/.rbenv/bin" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -t 1 ]]; then
  export GPG_TTY="$(tty)"
fi

export NVM_DIR="$HOME/.nvm"

if [[ -d "/usr/local/heroku/bin" ]]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [[ -n "$QMK_HOME" ]]; then
  export QMK_HOME="$QMK_HOME"
fi

if [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi

if [[ -d "/Applications/010 Editor.app/Contents/CmdLine" ]]; then
  export PATH="$PATH:/Applications/010 Editor.app/Contents/CmdLine"
fi
