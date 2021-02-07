#!/bin/sh
# reset dunst
pkill dunst
source $HOME/.cache/wal/colors.sh
dunst -frame_color $color8 -lb $background -nb $background -cb $background -lf $foreground -nf $foreground -cf $foreground -lfr $foreground -nfr $foreground -cfr $foreground &