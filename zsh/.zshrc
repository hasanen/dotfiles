#!/bin/zsh
 
# Aliases
alias youtube2mp3="youtube-dl -t --extract-audio --audio-format=mp3"
alias gdnws='git diff --ignore-space-at-eol -b -w --ignore-blank-lines'
 
# docker
alias dcr='docker-compose run'
alias dcre='docker-compose restart'
alias dcu='docker-compose up'
alias dcs='docker-compose stop'
alias dcb='docker-compose build'
alias dr='docker run'
alias ds='docker stats --format "table {{.Name}}\t{{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"'
alias dps='docker ps'
alias drti='dr -ti'

#zsh
alias zshch='source ~/.zshrc'

# Programming language tools
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
[[ -s $HOME/.rsvm/rsvm.sh ]] && . $HOME/.rsvm/rsvm.sh # This loads RSVM

export ANDROID_HOME=/usr/local/share/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools 
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Heroku 
export PATH="$PATH:/usr/local/heroku/bin"

# Travis
[ -f /Users/hasanen/.travis/travis.sh ] && source /Users/hasanen/.travis/travis.sh

## Oh my zsh settings
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pieceofcode"
plugins=(osx git rvm pass)
source $ZSH/oh-my-zsh.sh

unsetopt nomatch

# My own scripts
export PATH=$PATH:$HOME/bin

#Locales
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Random stuff
export TERMINAL=guake
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export EDITOR=vim
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"
