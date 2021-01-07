#!/bin/sh

# Terminate already running bar instances
killall -q polybar
 
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done
 
polybar left -c ~/.config/polybar/config.ini &
polybar mid -c ~/.config/polybar/config.ini &
polybar right -c ~/.config/polybar/config.ini &
