#!/usr/bin/env bash

set -euo pipefail

CWD="$(dirname "$0")"

# Install Homebrew
echo "### 1. Install Homebrew"

if type brew >/dev/null 2>&1; then
	echo "Homebrew is already installed ..."
else
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Brew Install
echo "### 2. Run Brew Install"
skip_brew_install=${SKIP_BREW_INSTALL:-}

if [[ "$skip_brew_install" != "" ]]; then
	echo "Skipping Brew Install"
else
	brew bundle --file=$CWD/Brewfile
fi

# Install Oh-My-Zsh
echo "### 3. Install Oh-My-Zsh"

if [[ -f "/usr/local/opt/zplug/repos/robbyrussell/oh-my-zsh/lib/cli.zsh" ]]; then
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
echo "Installing Vundle..."

if [[ -f "$HOME/.vim/bundle/Vundle.vim" ]]; then
  echo "Vundle is already installed."
else
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Running Vundle +PluginInstall +qall"
vim +PluginInstall +qall



# Docker Buildx
echo "### 6. Installing Docker Buildx"

BUILDX_RELEASE_PREFIX="https://github.com/docker/buildx/releases/download/v0.7.1/buildx-v0.7.1.darwin-"

if [[ `uname -m` == 'arm64' ]]; then
  BUILDX_RELEASE_SUFFIX="arm64"
else
	BUILDX_RELEASE_SUFFIX="amd64"
fi

mkdir -p "$HOME/.docker/cli-plugins"

if [[ -f "$HOME/.docker/cli-plugins/docker-buildx" ]]; then
  echo "Buildx is already installed. Skipping."
else
	wget "${BUILDX_RELEASE_PREFIX}${BUILDX_RELEASE_SUFFIX}" -O ~/.docker/cli-plugins/docker-buildx 
	chmod +x ~/.docker/cli-plugions/docker-buildx
fi




