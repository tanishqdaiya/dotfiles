#!/bin/bash

# Restore the previous wallpaper settings
nitrogen --restore
picom -b --config ~/.config/picom/picom.conf

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar top &

