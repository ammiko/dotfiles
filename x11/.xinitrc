#!/bin/sh
xset r rate 280 40
setxkbmap -option "ctrl:swap_lalt_lctl" 
setxkbmap -option "caps:swapescape" 
export MOZ_X11_EGL=1
mpris-proxy &
dunst &
~/.fehbg &
picom --experimental-backends -b &
sxhkd &
exec bspwm
#while true; do
#    # Log stderror to a file 
#    dwm 2> ~/.dwm.log
#    # No error logging
#    dwm >/dev/null 2>&1
#done


