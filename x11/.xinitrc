#!/bin/sh
xset r rate 280 40
setxkbmap -option "ctrl:swap_lalt_lctl" 
setxkbmap -option "caps:swapescape" 
unclutter --timeout 2 &
nm-applet --indicator &
emacs --daemon &
syncthing &
~/.fehbg
lxsession &
mpris-proxy &
sxhkd &
picom --experimental-backends -b &
exec awesome
