#!/bin/zsh
 
# General aliases
alias youtube2mp3="youtube-dl -t --extract-audio --audio-format=mp3"
alias gdnws='git diff --ignore-space-at-eol -b -w --ignore-blank-lines'
alias gitdiff="git difftool HEAD^ HEAD"
alias git_purge_merged_branches="git branch --merged | grep -v \* | xargs git branch -D"
 
## docker
alias dcr='docker compose run'
alias dce='docker compose exec'
alias dcre='docker compose restart'
alias dcu='docker compose up'
alias dcs='docker compose stop'
alias dcb='docker compose build'
alias dr='docker run'
alias ds='docker stats --format "table {{.Name}}\t{{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"'
alias dps='docker ps'
alias drti='dr -ti'

### apps
alias jupyter_pwd='docker run -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work jupyter/all-spark-notebook'

## misc
alias debian='docker run -v "$PWD":/opt/host-pwd -ti debian'
alias kali='docker run -v "$PWD":/opt/host-pwd -ti kalilinux/kali-last-release'

##zsh
alias zshch='source ~/.zshrc'


## heroku
alias hcr="heroku console -r"
alias hca="heroku console --app"
alias hltr="heroku logs --tail -r"
alias hlta="heroku logs --tail --app"

## java
JAVA_VERSION_TAG=20-jdk-oraclelinux8
alias java="docker run openjdk:$JAVA_VERSION_TAG java"
alias javac="docker run openjdk:$JAVA_VERSION_TAG javac"


# Functions
otp () {
  python -c "import pyotp; print(pyotp.TOTP('$1').now())"
}

if [[ -n "$NVM_DIR" ]] && [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
fi

## Oh my zsh settings
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  ZSH="$HOME/.oh-my-zsh"
  plugins=(macos git)
  source "$ZSH/oh-my-zsh.sh"
fi

# Disable pattern matching to make [] etc chars to work "normally"
unsetopt nomatch

if [[ -n "$NVM_DIR" ]] && [ -s "$NVM_DIR/bash_completion" ]; then
  . "$NVM_DIR/bash_completion"
fi

UNAME_MACHINE="$(/usr/bin/uname -m)"

if [[ -x "/opt/homebrew/bin/brew" ]]; then
  eval "$('/opt/homebrew/bin/brew' shellenv)"
  export BREW_FZF_PATH="/opt/homebrew/opt/fzf"
fi

if [[ -x "/usr/local/bin/brew" ]]; then
  eval "$('/usr/local/bin/brew' shellenv)"
fi

if [[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]]; then
  . "$HOME/google-cloud-sdk/path.zsh.inc"
fi

if [[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]]; then
  . "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

## ruby/rails related
alias be='bundle exec'
if command -v rv >/dev/null 2>&1; then
  eval "$(rv shell init zsh)"
fi

# for picocom
alias picocom="stty erase ^H && picocom"

if [[ -d "/Applications/010 Editor.app/Contents/CmdLine" ]]; then
  export PATH="$PATH:/Applications/010 Editor.app/Contents/CmdLine"
fi

if [[ -d "$HOME/.lmstudio/bin" ]]; then
  export PATH="$PATH:$HOME/.lmstudio/bin"
fi

if [[ -f "$HOME/export-esp.sh" ]]; then
  . "$HOME/export-esp.sh"
fi

if command -v kiro >/dev/null 2>&1; then
  [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
fi
