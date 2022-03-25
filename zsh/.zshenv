DEBIAN_PREVENT_KEYBOARD_CHANGES=yes
export TERMINAL=guake
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export EDITOR=vim
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"

export ANDROID_HOME=/usr/local/share/android-sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tool:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$HOME/go/bin:$PATH"

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
export QMK_HOME='~/code/qmk_firmware'

source $HOME/.cargo/env
