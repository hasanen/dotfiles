#!/bin/zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Setting up oh-my-zshs"
  git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
  git clone https://github.com/hasanen/oh-my-zsh-themes.git $HOME/.oh-my-zsh-themes
  ln -sf $HOME/.oh-my-zsh-themes/pieceofcode.zsh-theme $HOME/.oh-my-zsh/themes/pieceofcode.zsh-theme
fi

if [ ! -d "$HOME/.zsh" ]; then
  echo "Linking zsh configs"
  ln -sf $HOME/dotfiles/zsh/.zsh $HOME/
  ln -sf $HOME/dotfiles/zsh/.zshenv $HOME/
  ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/
fi

if [ ! -d "$HOME/.zsh" ]; then
  echo "Setting up vim"
  ln -sf $HOME/dotfiles/vim/.vimrc $HOME/
  mkdir -p $HOME/.vim/bundle
  mkdir -p $HOME/.vim/colors
  wget https://raw.githubusercontent.com/garybernhardt/dotfiles/master/.vim/colors/grb256.vim -P $HOME/.vim/colors/
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  vim +PluginInstall +q +q
fi

if [ ! -f "$HOME/.gitconfig" ]; then
  echo "Linking git configs"
  ln -sf $HOME/dotfiles/git/.gitconfig $HOME/
  ln -sf $HOME/dotfiles/git/.gitignore_global $HOME/
fi

if [ ! -d "$HOME/bin" ]; then
  echo "Linking bin scripts"
  mkdir $HOME/bin
  ln -sf $HOME/dotfiles/bin/* $HOME/bin/
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
  echo "Setting up tmux"
  ln -sf $HOME/dotfiles/tmux/.tmux.conf $HOME/
  ln -sf $HOME/dotfiles/tmux/tmux-wt-wp $HOME/bin/
  ln -sf $HOME/dotfiles/tmux/tmux-rails $HOME/bin/
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

if [ ! -f "$HOME/.ctags" ]; then
  echo "Linking ctags configs"
  ln -sf $HOME/dotfiles/ctags/.ctags $HOME/
fi

if [ ! -d "$HOME/.bundle" ]; then
  echo "Linking bundler configs"
  mkdir $HOME/.bundle
  ln -sf $HOME/dotfiles/bundle/config $HOME/.bundle/config
fi

if [ ! -d "$HOME/.rsvm" ]; then
  echo "Installing RSVM"
  \curl -L https://raw.github.com/sdepold/rsvm/master/install.sh | sh
fi

if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
fi

if [ ! -d "$HOME/.kiex" ]; then
  echo "Install kiex"
  \curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
fi

if [ ! -d "$HOME/.pyenv" ]; then
  echo "Install pyenv"
  git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
fi

if [ ! -d "$HOME/.rbenv" ]; then
  echo "Install rbenv"
  git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
fi

if [ ! -d "$HOME/.goenv" ]; then
  echo "Install goenv"
  git clone https://github.com/syndbg/goenv.git $HOME/.goenv
  goenv install 1.11.4
  goenv global 1.11.4
fi

source ~/.zshrc
go get github.com/ffuf/ffuf
