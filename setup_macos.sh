#!/bin/bash

echo "Installing brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing cli software"
brew install ffmpeg
brew install pyenv
brew install ansible
brew install git
brew install p7zip
brew install ssh-copy-id
brew install the_silver_searcher
brew install tmux
brew install tree
brew install wget
brew install youtube-dl
brew install vim --override-system-vi
brew install coreutils
brew install zsh
brew install ctags
brew install yarn
brew install mosh
brew install screenfetch
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
brew install heroku/brew/heroku
brew install reattach-to-user-namespace
brew install watchman
brew install fzf
brew install erlang
brew install rbenv
brew install goenv

echo "Installing caskroom"
brew install caskroom/cask/brew-cask

echo "Installing gui software"
brew cask install 1password
brew cask install java
brew cask install vlc
brew cask install alfred
brew cask install spotify
brew cask install iterm2
brew cask install firefox
brew cask install libreoffice
brew cask install virtualbox
brew cask install heroku-toolbelt
brew cask install dash
brew cask install toggl
brew cask install adobe-creative-cloud
brew cask install docker
brew cask install little-snitch
open /usr/local/Caskroom/little-snitch/**/Little\ Snitch\ Installer.app
brew cask install standard-notes
brew cask install kindle
brew cask install android-sdk
brew cask install android-studio
brew cask install postgres
brew cask install flowdock
brew cask install slack
brew cask install postman
brew cask install thunderbird
brew cask install freedome
brew cask install licecap
brew cask install telegram

echo "Following apps needs to be installed manually:"
echo "- Firefox developer edition: https://www.mozilla.org/en-US/firefox/developer/"

echo "Install following apps from app store"
echo "- FreckleTimer"
echo "- Todoist"
echo "- Micro snitch"
echo "- FoldingText"
echo "- Deckset"

echo "Set contact information with: sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText \"Message\""
