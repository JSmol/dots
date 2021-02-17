#!/bin/sh

cd $HOME

# xorg (xf86-video-vesa)
pkgs="xorg xorg-xinit "
# wm environment and tools
pkgs+="alacritty bspwm sxhkd feh vim dunst openssh rofi xdg-user-dirs xdg-utils xf86-input-synaptics pulseaudio pamixer pavucontrol "
# dev tools
pkgs+="neovim fish python python-pip docker gcc unzip git github-cli nodejs npm rustup "
# misc
pkgs+="jq neofetch imagemagick redshift firefox discord playerctl "
# fonts
pkgs+="ttf-hack ttf-inconsolata noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-nerd-fonts-symbols-mono ttf-font-awesome "
sudo pacman -S $pkgs
chsh -s `which fish`

# python packages for ML and extra tools I use
pippkgs="numpy sympy scipy matplotlib seaborn pandas torch torchvision torchaudio "
pippkgs+="bs4 lxml kaggle jupyterlab pynvim pywal pywalfox "
pip install $pippkgs

# firefox theme
python -m pywalfox install

# vim/nvim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

