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

## ruby/rails related
alias be='bundle exec'
alias rbenv_refresh="git -C /Users/hasanen/.rbenv/plugins/ruby-build pull"

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

[[ -s $HOME/.rsvm/rsvm.sh ]] && . $HOME/.rsvm/rsvm.sh # This loads RSVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

## Oh my zsh settings
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pieceofcode"
plugins=(macos git rvm pass)
source $ZSH/oh-my-zsh.sh

# Disable pattern matching to make [] etc chars to work "normally"
unsetopt nomatch

eval "$(rbenv init -)"
eval "$(pyenv init --path)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

UNAME_MACHINE="$(/usr/bin/uname -m)"

if [[ "${UNAME_MACHINE}" == "arm64" ]]
then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  # used in .vimrc
  export BREW_FZF_PATH=/opt/homebrew/opt/fzf
else
  # used in .vimrc
  export BREW_FZF_PATH=/usr/local/opt/fzf
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
