#!/bin/bash

# Restore the previous wallpaper settings
feh --bg-scale ~/Pictures/Wallpapers/9d71fdf6ee231.png
picom -b --config ~/.config/picom/picom.conf

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar top &

