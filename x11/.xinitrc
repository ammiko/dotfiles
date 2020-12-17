#!/bin/sh
xset r rate 280 40
setxkbmap -option "ctrl:swap_lalt_lctl" 
setxkbmap -option "caps:swapescape" 
mpris-proxy &
sxhkd -c ~/.config/sxhkd/sxhkd_bspwm &
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


