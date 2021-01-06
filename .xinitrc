# xrandr --output HDMI-0 --left-of DVI-D-0
setxkbmap -option caps:escape

# dont remember what this does LOL
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# python3 -m http.server -d / &
~/.config/scripts/wal-tile &

# redshift -P -O 5000 &
picom -b --config ~/.config/picom.conf &

# exec xmonad
exec bspwm

