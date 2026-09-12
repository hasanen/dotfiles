#!/usr/bin/env zsh

REPO_ROOT="${REPO_ROOT:-$(cd -- "$(dirname -- "${0}")" && pwd)}"
export REPO_ROOT

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Setting up oh-my-zshs"
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
fi

if [ ! -d "$HOME/.zsh" ]; then
  echo "Linking zsh configs"
  ln -sf "$REPO_ROOT/zsh/.zsh" "$HOME/"
  ln -sf "$REPO_ROOT/zsh/.zshenv" "$HOME/"
  ln -sf "$REPO_ROOT/zsh/.zshrc" "$HOME/"
fi

if [ ! -d "$HOME/.config/starship.toml" ]; then
  echo "Linking starship configs"
  mkdir -p "$HOME/.config"
  ln -sf "$REPO_ROOT/starship/starship.toml" "$HOME/.config/"
fi

if [ ! -d "$HOME/.vim" ]; then
  echo "Setting up vim"
  ln -sf "$REPO_ROOT/vim/.vimrc" "$HOME/"
  mkdir -p "$HOME/.vim/bundle" "$HOME/.vim/colors"
  curl https://raw.githubusercontent.com/garybernhardt/dotfiles/master/.vim/colors/grb256.vim -o "$HOME/.vim/colors/grb256.vim"
  git clone https://github.com/gmarik/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
  vim +PluginInstall +q +q
fi

if [ ! -f "$HOME/.gitconfig" ]; then
  echo "Linking git configs"
  ln -sf "$REPO_ROOT/git/.gitconfig" "$HOME/"
  ln -sf "$REPO_ROOT/git/.gitignore_global" "$HOME/"
  ln -sf "$REPO_ROOT/git/.gitconfig-disobey" "$HOME/"
  ln -sf "$REPO_ROOT/git/.gitconfig-personal" "$HOME/"
fi

if [ ! -d "$HOME/bin" ]; then
  echo "Linking bin scripts"
  mkdir -p "$HOME/bin"
  ln -sf "$REPO_ROOT/bin"/* "$HOME/bin/"
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
  echo "Setting up tmux"
  ln -sf "$REPO_ROOT/tmux/.tmux.conf" "$HOME/"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

if [ ! -f "$HOME/.ctags" ]; then
  echo "Linking ctags configs"
  ln -sf "$REPO_ROOT/ctags/.ctags" "$HOME/"
fi

if [ ! -d "$HOME/.bundle" ]; then
  echo "Linking bundler configs"
  mkdir -p "$HOME/.bundle"
  ln -sf "$REPO_ROOT/bundle/config" "$HOME/.bundle/config"
fi

if [ ! -d "$HOME/.cargo" ]; then
  echo "Installing installing rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
fi

source "$HOME/.zshrc"
