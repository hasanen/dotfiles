#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=linux;;
    Darwin*)    machine=mac;;
esac

if [ $machine = "mac" ]; then
	./setup_macos.sh
fi
if [ $machine = "linux" ]; then
	./setup_debian.sh
fi
if [[ $(uname -a) =~ "kali" ]]; then
	./setup_kali.sh
fi

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
vim +PluginInstall +q +q

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

echo "Linking ctags configs"
ln -sf $HOME/dotfiles/ctags/.ctags $HOME/

echo "Linking bundler configs"
mkdir $HOME/.bundle
ln -sf $HOME/dotfiles/bundle/config $HOME/.bundle/config

echo "Installing RSVM"
\curl -L https://raw.github.com/sdepold/rsvm/master/install.sh | sh

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash

echo "Install kiex"
\curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
