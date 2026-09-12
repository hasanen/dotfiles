#!/usr/bin/env zsh

set -euo pipefail

REPO_ROOT="${REPO_ROOT:-$(cd -- "$(dirname -- "${0}")" && pwd)}"
export REPO_ROOT

assert_file_exists() {
  local path="$1"
  local label="$2"

  if [[ ! -f "$path" ]]; then
    echo "ERROR: missing $label at $path" >&2
    exit 1
  fi
}

link_if_safe() {
  local src="$1"
  local dst="$2"
  local label="${3:-$dst}"

  mkdir -p "$(dirname -- "$dst")"

  if [[ -L "$dst" ]]; then
    local current
    current="$(readlink "$dst")"
    if [[ "$current" == "$src" ]]; then
      echo "Already linked: $label"
      return 0
    fi
    echo "Conflict: $label already points to $current; leaving it alone"
    return 0
  fi

  if [[ -e "$dst" ]]; then
    echo "Conflict: $label already exists; leaving it alone"
    return 0
  fi

  ln -s "$src" "$dst"
  echo "Linked: $label"
}

assert_file_exists "$REPO_ROOT/git/.gitconfig" "Git base config"
assert_file_exists "$REPO_ROOT/git/.gitignore_global" "Git ignore file"
assert_file_exists "$REPO_ROOT/git/.gitconfig-disobey" "Git disobey include"
assert_file_exists "$REPO_ROOT/git/.gitconfig-personal" "Git personal include"
assert_file_exists "$REPO_ROOT/git/.git-commit-template" "Git commit template"

link_if_safe "$REPO_ROOT/git/.git-commit-template" "$HOME/.git-commit-template" ".git-commit-template"

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Setting up oh-my-zshs"
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
fi

link_if_safe "$REPO_ROOT/zsh/.zsh" "$HOME/.zsh" ".zsh"
link_if_safe "$REPO_ROOT/zsh/.zshenv" "$HOME/.zshenv" ".zshenv"
link_if_safe "$REPO_ROOT/zsh/.zshrc" "$HOME/.zshrc" ".zshrc"

mkdir -p "$HOME/.config"
link_if_safe "$REPO_ROOT/starship/starship.toml" "$HOME/.config/starship.toml" "starship config"

if [[ ! -d "$HOME/.vim" ]]; then
  echo "Setting up vim"
  mkdir -p "$HOME/.vim/bundle" "$HOME/.vim/colors"
  link_if_safe "$REPO_ROOT/vim/.vimrc" "$HOME/.vimrc" ".vimrc"
  if [[ ! -f "$HOME/.vim/colors/grb256.vim" ]]; then
    curl https://raw.githubusercontent.com/garybernhardt/dotfiles/master/.vim/colors/grb256.vim -o "$HOME/.vim/colors/grb256.vim"
  fi
  if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
    git clone https://github.com/gmarik/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
  fi
  if command -v vim >/dev/null 2>&1; then
    vim +PluginInstall +q +q
  else
    echo "vim not found; skipping plugin install"
  fi
else
  link_if_safe "$REPO_ROOT/vim/.vimrc" "$HOME/.vimrc" ".vimrc"
fi

link_if_safe "$REPO_ROOT/git/.gitconfig" "$HOME/.gitconfig" ".gitconfig"
link_if_safe "$REPO_ROOT/git/.gitignore_global" "$HOME/.gitignore_global" ".gitignore_global"
link_if_safe "$REPO_ROOT/git/.gitconfig-disobey" "$HOME/.gitconfig-disobey" ".gitconfig-disobey"
link_if_safe "$REPO_ROOT/git/.gitconfig-personal" "$HOME/.gitconfig-personal" ".gitconfig-personal"

mkdir -p "$HOME/bin"
for script in "$REPO_ROOT/bin"/*; do
  [[ -e "$script" ]] || continue
  link_if_safe "$script" "$HOME/bin/$(basename -- "$script")" "bin/$(basename -- "$script")"
done

if [[ ! -f "$HOME/.tmux.conf" ]]; then
  echo "Setting up tmux"
  link_if_safe "$REPO_ROOT/tmux/.tmux.conf" "$HOME/.tmux.conf" ".tmux.conf"
  if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  fi
else
  link_if_safe "$REPO_ROOT/tmux/.tmux.conf" "$HOME/.tmux.conf" ".tmux.conf"
fi

link_if_safe "$REPO_ROOT/ctags/.ctags" "$HOME/.ctags" ".ctags"

mkdir -p "$HOME/.bundle"
link_if_safe "$REPO_ROOT/bundle/config" "$HOME/.bundle/config" "bundler config"

if [[ ! -f "$HOME/.cargo/env" ]]; then
  echo "Installing rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

if [[ ! -d "$HOME/.nvm" ]]; then
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | bash
fi
