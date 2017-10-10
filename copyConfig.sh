#!/bin/bash
#shell
cp ~/.zshrc .
cp ~/.aliases .
#x server
cp ~/.xinitrc .
cp ~/.Xresources . 
cp -r ~/.Xresources.d .
#i3
cp -r ~/.config/i3/ ./.config/.
cp -r ~/.config/polybar/ ./.config/.
#tmux
cp -r ~/.tmux.conf ./.tmux.conf
#vim
cp ~/.vimrc .

#mopidy
cp -r ~/.config/mopidy ./.config/.

#xbindkey
cp ~/.xbindkeysrc .

#tmux
cp ~/.tmux.conf .
cp ~/.tmux.conf.bak .
