# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/minh/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# fonts
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

# brew packages
# brew install chezmoi
brew install neovim
brew install curl
brew install zsh
brew install fasd
brew install fzf
brew install the_silver_searcher
brew install fzf

# iterm
# https://github.com/one-dark/iterm-one-dark-theme

# chezmoi
# chezmoi init <GIT URL>


# zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# TODO get zshrc

# nvim

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# TODO .tmux.conf

# fzf


### Full Stack 
# pyenv
brew install pyenv
brew install pyenv-virtualenv


# 1password
brew install --cask 1password/tap/1password-cli

# JS
brew install npm
npm install typescript --save-dev

# dotfiles
