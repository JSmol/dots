#!/bin/sh

cd $HOME

# xorg (xf86-video-vesa)
pkgs="xorg xorg-xinit "

# wm environment and tools
pkgs+="alacritty bspwm sxhkd feh vim dunst openssh rofi xdg-user-dirs xf86-input-synaptics pulseaudio pamixer pavucontrol "

# dev tools
pkgs+="vim fish python python-pip jupyterlab code docker gcc unzip git github-cli nodejs npm rustup "

# misc
pkgs+="jq neofetch imagemagick python-pywal redshift firefox discord playerctl "

# fonts and shit
pkgs+="ttf-hack ttf-inconsolata noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-nerd-fonts-symbols-mono "

# aur packages
aur="spotify polybar picom-git"

# other
other="eww starship spotifyd"

# sudo pacman -Sp $pkgs
echo "manually install: $aur $other" >> TODO

# for website management
npmpkgs="firebase-tools "
# sudo npm -g i $npmpkgs

# stuff I will inevitably use
pippkgs="numpy matplotlib pandas torch torchvision torchaudio bs4 lxml kaggle "
# pip install $pippkgs

