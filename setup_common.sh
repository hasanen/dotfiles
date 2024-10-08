#!/bin/zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Setting up oh-my-zshs"
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
fi

if [ ! -d "$HOME/.zsh" ]; then
  echo "Linking zsh configs"
  ln -sf $HOME/dotfiles/zsh/.zsh $HOME/
  ln -sf $HOME/dotfiles/zsh/.zshenv $HOME/
  ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/
fi

if [ ! -d "$HOME/.config/starship.toml" ]; then
  echo "Linking starship configs"
  mkdir -p ~/.config
  ln -sf $HOME/dotfiles/starship/starship.toml $HOME/.config/
fi


if [ ! -d "$HOME/.vim" ]; then
  echo "Setting up vim"
  ln -sf $HOME/dotfiles/vim/.vimrc $HOME/
  mkdir -p $HOME/.vim/bundle
  mkdir -p $HOME/.vim/colors
  curl https://raw.githubusercontent.com/garybernhardt/dotfiles/master/.vim/colors/grb256.vim -o $HOME/.vim/colors/grb256.vim
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

if [ ! -d "$HOME/.cargo" ]; then
  echo "Installing installing rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
fi

if [ ! -d "$HOME/.pyenv" ]; then
  echo "Install pyenv"
  git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
  eval "$(pyenv init -)"
fi

if [ ! -d "$HOME/.rbenv" ]; then
  echo "Install rbenv"
  git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
  eval "$(~/.rbenv/bin/rbenv init - zsh)"
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
fi

if [ ! -f "$HOME/.local/bin/poetry" ]; then
  echo "Install Poetry"
  curl -sSL https://install.python-poetry.org | python3 -
fi

source ~/.zshrc
