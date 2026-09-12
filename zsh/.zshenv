export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export NVM_DIR="$HOME/.nvm"

if [[ -d "$HOME/.rbenv/bin" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

if [[ -t 1 ]]; then
  export GPG_TTY="$(tty)"
fi

if [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi
