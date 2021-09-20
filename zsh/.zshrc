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

##zsh
alias zshch='source ~/.zshrc'

## ruby/rails related
alias be='bundle exec'
alias rbenv_refresh="git -C /Users/hasanen/.rbenv/plugins/ruby-build pull"

[[ -s $HOME/.rsvm/rsvm.sh ]] && . $HOME/.rsvm/rsvm.sh # This loads RSVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

## Oh my zsh settings
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pieceofcode"
plugins=(osx git rvm pass)
source $ZSH/oh-my-zsh.sh

# Disable pattern matching to make [] etc chars to work "normally"
unsetopt nomatch

eval "$(rbenv init -)"
eval "$(pyenv init --path)"
eval "$(goenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hasanen/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hasanen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hasanen/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hasanen/google-cloud-sdk/completion.zsh.inc'; fi
