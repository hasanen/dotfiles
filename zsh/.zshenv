DEBIAN_PREVENT_KEYBOARD_CHANGES=yes
export TERMINAL=guake
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export EDITOR=vim
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export GPG_TTY=$(tty)


# Check if the system is Linux and start ssh-agent if not already running
if [ "$(uname -s)" = "Linux" ]; then
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        eval "$(ssh-agent -s)"
    fi
fi

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

export PATH="$PATH:/Applications/010 Editor.app/Contents/CmdLine" #ADDED BY 010 EDITOR
