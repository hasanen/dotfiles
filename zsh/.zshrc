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

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
[[ -s $HOME/.rsvm/rsvm.sh ]] && . $HOME/.rsvm/rsvm.sh # This loads RSVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Travis
[ -f /Users/hasanen/.travis/travis.sh ] && source /Users/hasanen/.travis/travis.sh

## Oh my zsh settings
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pieceofcode"
plugins=(osx git rvm pass)
source $ZSH/oh-my-zsh.sh

unsetopt nomatch

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(goenv init -)"
