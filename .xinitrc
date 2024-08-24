#!/bin/sh

picom &
feh --bg-scale ~/cyberpunk.jpg &

# Kill any existing Polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch your Polybar configuration called "mybar"
polybar mybar &


exec i3
