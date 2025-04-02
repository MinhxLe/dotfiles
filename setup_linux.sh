#!/bin/bash

add-apt-repository ppa:neovim-ppa/unstable
apt-get update
# TODO pin version
apt-get install tmux zsh fzf silversearcher-ag neovim -y

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed"
fi

# TODO checkout .zshrc again b/c it gets clobbered

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

# TODO
# tmux is bugged where it defaults to bash intead of using zsh
