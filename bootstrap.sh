#!/usr/bin/env bash

set -euo pipefail

CWD="$(realpath $(dirname "$0"))"

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

installed_plugins=$(asdf plugin list 2>/dev/null || true)

if [[ $installed_plugins != *"ruby"* ]]; then
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

if [[ $installed_plugins != *"nodejs"* ]]; then
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

# Symlinks
echo "### 5. Configure Symlinks"

SYMLINK_FOLDERS=(.vim .vimrc .vimrc.d .ssh/config .zsh .zshrc)

rm -f "$HOME/.zshrc"

for i in ${SYMLINK_FOLDERS[@]}; do
  src_dir="${CWD}/${i}"
  dest_dir="$HOME/${i}"

  if [ -d "${dest_dir}" ] || [ -L "${dest_dir}" ] || [ -f "${dest_dir}" ]; then
    echo "${dest_dir} exists. Skipping..."
  else
    ln -s "$src_dir" "$dest_dir"
  fi
done

# Install zsh plugins
echo "### 6. Installing zsh plugins..."

ZSH_PLUGINS=("chrissicool/zsh-256color" "zsh-users/zsh-syntax-highlighting")

zsh_plugins_location=".oh-my-zsh/custom/plugins"

mkdir -p "$HOME/${zsh_plugins_location}"

for i in ${ZSH_PLUGINS[@]}; do
  dest_dir="$zsh_plugins_location/"$(basename ${i})""

  if [ -d "${dest_dir}" ] || [ -L "${dest_dir}" ] || [ -f "${dest_dir}" ]; then
    echo "${dest_dir} exists. Skipping..."
  else
    git clone "git@github.com:${i}" "$dest_dir"
  fi
done

echo "DONE!"
