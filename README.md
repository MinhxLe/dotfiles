# set up
```
git clone --bare git@github.com:MinhxLe/dotfiles.git $HOME/.dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dots checkout
# ./setup_linux.sh
dots checkout .zshrc
```
