DEBIAN_PREVENT_KEYBOARD_CHANGES=yes
export TERMINAL=guake
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export EDITOR=vim
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"

export ANDROID_HOME=/usr/local/share/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools 
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

export NVM_DIR="$HOME/.nvm"

# Heroku 
export PATH="$PATH:/usr/local/heroku/bin"
#
# My own scripts
export PATH=$PATH:$HOME/bin

#Locales
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
