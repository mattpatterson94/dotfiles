#!/usr/bin/env bash

set -euo pipefail

CWD="$(dirname "$0")"

# Install Homebrew
echo "### 1. Install Homebrew"

if type brew >/dev/null 2>&1; then
	echo "Homebrew is already installed ..."
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Brew Install
echo "### 2. Run Brew Install"
skip_brew_install=${SKIP_BREW_INSTALL:-}

if [[ "$skip_brew_install" != "" ]]; then
	echo "Skipping Brew Install"
else
	HOMEBREW_NO_UPGRADE=1 brew bundle --file=$CWD/Brewfile
fi

# Install Oh-My-Zsh
echo "### 3. Install Oh-My-Zsh"

if [[ -d "$HOME/.oh-my-zsh" ]]; then
	echo "Oh-My-Zsh is already installed ..."
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ASDF Plugins
echo "### 4. Install ASDF Plugins"

installed_plugins=$(asdf plugin list)

if [[ $installed_plugins != *"ruby"* ]]; then
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

if [[ $installed_plugins != *"nodejs"* ]]; then
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

if [[ $installed_plugins != *"yarn"* ]]; then
  asdf plugin add yarn
fi

if [[ $installed_plugins != *"terraform"* ]]; then
  asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
fi

# Symlinks
echo "### 5. Configure Symlinks"

SYMLINK_FOLDERS=(.vim .vimrc .vimrc.d .ssh/config .zsh .zshrc)

for i in ${SYMLINK_FOLDERS[@]}; do
	src_dir="${CWD}/${i}"
	dest_dir="$HOME/${i}"

  if [ -d "${dest_dir}" ] || [ -L "${dest_dir}" ] || [ -f "${dest_dir}" ]; then
		echo "${dest_dir} exists. Skipping..."
	else
		ln -s "$src_dir" "$dest_dir"
  fi
done

# Install Vundle
echo "### 6. Installing Vundle..."

if [[ -d "$CWD/.vim/bundle/Vundle.vim" ]]; then
  echo "Vundle is already installed."
else
  git clone https://github.com/VundleVim/Vundle.vim.git $CWD/.vim/bundle/Vundle.vim
fi

echo "Running Vundle +PluginInstall +qall"
vim +PluginInstall +qall


echo "DONE!"
