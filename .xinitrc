#!/bin/sh

picom &
polybar &
feh --bg-scale ~/Downloads/cyberpunk.jpg &

exec i3
