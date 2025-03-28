#!/bin/bash

# Update package list only if it hasn't been updated recently
apt_updated=false
if [ $(find /var/lib/apt/lists -maxdepth 0 -mtime +1 | wc -l) -gt 0 ]; then
    echo "Updating package lists..."
    apt update
    apt_updated=true
fi

# Check and install packages
for package in tmux neovim zsh fzf silversearcher-ag; do
    if ! dpkg -l | grep -q " $package "; then
        echo "Installing $package..."
        if [ "$apt_updated" = false ]; then
            apt update
            apt_updated=true
        fi
        apt install -y $package
    else
        echo "$package is already installed"
    fi
done

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed"
fi


# Install tmux plugin manager if not already installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing tmux plugin manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "tmux plugin manager is already installed"
fi

# Install NvChad 
echo "Installing NvChad..."
git clone https://github.com/NvChad/starter ~/.config/nvim --depth 1
ln -sf ~/.config/nvim_custom/custom ~/.config/nvim/lua/custom
    
# Install uv if not already installed
if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
else
    echo "uv is already installed"
fi


# remote specific
user=$(whoami)
chsh $user -s /bin/zsh

echo "Setup complete!"


