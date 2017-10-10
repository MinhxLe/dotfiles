#setting up wifi
wicd
wicd-gtk
systemctl stop dchcd
systemctl start wicd.service
#setting up basic DE
i3
xfce4
xorg

#setting up audio
pulseaudio
pavucontrol
alsa-utils
pulseaudio-alsa
#setting up basic programs

evince
#setting up basic dev stuff
git
vim
sbcl
octave
autojump
#xsh
zsh
zsh-completions
chsh -l

#exteranl harddrive
udisks2

#setting up keyserver
gdg


#setting up a user
sudo set up

#community
pacaur
#battery
pacman -S --needed base-devel
#as minh
mkdir builds
cd ~/builds

curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/cower.tar.gz
tar -xvf cower.tar.gz



#config files
rofi
git clone https://github.com/MinhxLe/arch_configurations.git 

curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz
tar -xvf pacaur.tar.gz
cd pacaur

