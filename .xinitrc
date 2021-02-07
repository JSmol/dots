# xrandr --output HDMI-0 --left-of DVI-D-0
setxkbmap -option caps:escape

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xsetroot -cursor_name left_ptr

# python3 -m http.server -d / &
fish -c wal-random

# redshift -P -O 5000 &
# picom -b --config ~/.config/picom.conf --experimental-backends &

# https://github.com/ibhagwan/picom
/home/josip/dev/picom/build/src/picom -b --config ~/.config/picom.conf --experimental-backends &

# exec xmonad
exec bspwm

