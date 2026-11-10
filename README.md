# set up
```
git clone --bare https://github.com/MinhxLe/dotfiles.git $HOME/.dotfiles   # public, no auth
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dots config status.showUntrackedFiles no
dots checkout
~/.setup/bootstrap.sh server   # Arch; machines = ~/.setup/packages/*.txt
```
