#!/bin/bash
set -e

apt-get update
# TODO pin version
apt-get install tmux zsh fzf silversearcher-ag -y

# neovim
# Download and extract neovim AppImage
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage

# Extract AppImage without FUSE
./nvim-linux-x86_64.appimage --appimage-extract
sudo mv squashfs-root /opt/nvim
sudo ln -sf /opt/nvim/usr/bin/nvim /usr/local/bin/nvim
rm nvim.appimage

# Create symlink for 'vim' command (optional)
sudo ln -sf /usr/local/bin/nvim /usr/local/bin/vim


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
