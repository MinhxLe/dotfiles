#!/bin/bash

#x server
cp ~/.xinitrc .
cp ~/.Xresources . 
cp -r ~/.Xresources.d .
#i3
cp -r ~/.config/i3/ ./.config/.
cp -r ~/.config/polybar/ ./.config/polybar/
#vim
cp ~/.vimrc .
cp ~/.vim/init.vim .vim/init.vim

#xbindkey
cp ~/.xbindkeysrc .

#tmux
cp ~/.tmux.conf .
cp ~/.tmux.conf.bak .
cp ~/.tmux.conf.local .

#i3
#install nconsolata and fontawesome
cp ~/.config/i3/config .config/i3/config

#shell
cp ~/.zshrc .
cp ~/.aliases .
cp ~/.oh-my-zsh/themes/minimal2.zsh-theme .

#rofi
cp -r ~/.config/rofi ./.config/

#tmux
cp -r ~/.tmux.conf ./.tmux.conf

#mopidy
cp -r ~/.config/mopidy ./.config/.
