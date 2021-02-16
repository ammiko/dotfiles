#!/bin/sh
echo > ~/wallpaper.sh
printf 'swaybg -m fill -i ~/' >> ~/wallpaper.sh
printf $(sxiv -q -o -t dotfiles/wallpapers/*) | tee -a ~/wallpaper.sh
~/wallpaper.sh & disown
