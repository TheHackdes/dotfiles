#!/bin/bash

sudo pacman -S \
  btop \
  curl \
  docker \
  docker-compose \
  fastfetch \
  fd \
  gimp \
  htop \
  lazygit \
  lsd \
  neovim \
  npm \
  picom \
  timeshift \
  trash-cli \
  wget \
  zoxide

# Install stow

echo -e "\n🔍 Check if stow is installed..."

if ! command -v stow &>/dev/null; then
  echo -e "\n❌ stow could not be found. Installing stow..."
  sudo pacman -S stow
else
  echo -e "\n✅ stow is already installed."
fi

# Install Kitty

read -p "📦 Do you want to install Kitty? (y/n) " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]; then
  if ! command -v kitty &>/dev/null; then
    echo -e "\n🚀 Installing Kitty..."
    sudo pacman -S kitty
  else
    echo -e "\n✅ Kitty is already installed."
  fi
  stow kitty
  echo -e "\n📂 Kitty stowed."
else
  echo -e "\n⏭️ Skipping Kitty installation."
fi
