#!/bin/bash

cd $HOME/dotfiles
echo "Cloning repositories"
git clone https://github.com/hasanen/oh-my-zsh-themes.git $HOME/.oh-my-zsh-themes
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "Linking shell theme"
ln -sf $HOME/.oh-my-zsh-themes/pieceofcode.zsh-theme $HOME/.oh-my-zsh/themes/pieceofcode.zsh-theme

echo "Linking zsh configs"
ln -sf $HOME/dotfiles/zsh/.zsh $HOME/
ln -sf $HOME/dotfiles/zsh/.zshenv $HOME/
ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/
ln -sf $HOME/dotfiles/zsh/.zshrc.d $HOME/

echo "Linking vim configs"
ln -sf $HOME/dotfiles/vim/.vimrc $HOME/
mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.vim/colors
wget https://raw.githubusercontent.com/garybernhardt/dotfiles/master/.vim/colors/grb256.vim -P ~/.vim/colors/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Linking git configs"
ln -sf $HOME/dotfiles/git/.gitconfig $HOME/
ln -sf $HOME/dotfiles/git/.gitignore_global $HOME/

echo "Linking bin scripts"
mkdir $HOME/bin
ln -sf $HOME/dotfiles/bin/* $HOME/bin/

echo "Linking tmux configs"
ln -sf $HOME/dotfiles/tmux/.tmux.conf $HOME/
ln -sf $HOME/dotfiles/tmux/tmux-wt-wp $HOME/bin/
ln -sf $HOME/dotfiles/tmux/tmux-rails $HOME/bin/

echo "Linking slate configs"
ln -sf $HOME/dotfiles/slate/.slate $HOME/

echo "Linking ctags configs"
ln -sf $HOME/dotfiles/ctags/.ctags $HOME/

echo "Linking bundler configs"
mkdir $HOME/.bundle
ln -sf $HOME/dotfiles/bundle/config $HOME/.bundle/config

echo "Installin RVM"
\curl -sSL https://get.rvm.io | bash -s stable --ruby
\rvm gemset globalcache enable

echo "Installing RSVM"
\curl -L https://raw.github.com/sdepold/rsvm/master/install.sh | sh

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash

echo "Installing brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install klex"
\curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s

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
vim +PluginInstall +q +q
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

echo "Installing caskroom"
brew install caskroom/cask/brew-cask

echo "Installing gui software"
brew cask install 1password
brew cask install java
brew cask install spideroakone
brew cask install dropbox
brew cask install vlc
brew cask install alfred
brew cask install spotify
brew cask install iterm2
brew cask install firefox
brew cask install libreoffice
brew cask install virtualbox
brew cask install mattr-slate
brew cask install heroku-toolbelt
brew cask install dash
brew cask install gpg-suite
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
echo "- Monosnap"
echo "- Micro snitch"
echo "- FoldingText"
echo "- Deckset"

