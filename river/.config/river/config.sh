#!/bin/bash
swaybg -i ~/Downloads/oranges.jpg &
emacs --daemon &
mpris-proxy &
pulseaudio -D &
~/Downloads/test.sh
# Use the "logo" key as the primary modifier
mod="Mod4"
term="kitty"
# Custom Keybings
riverctl map normal $mod P spawn "bemenu-run -n -l 15"
# launch browser
riverctl map normal $mod B spawn 'MOZ_ENABLE_WAYLAND=1 firefox'
riverctl map normal $mod A spawn $term pulsemixer
riverctl map normal $mod E spawn 'emacsclient -c'
#launch a file browser
#riverctl map normal $mod F spawn shell command 'kitty nnn -e'
#riverctl map normal $mod Shift F spawn shell command $term ranger 

#bindsym $mod+shift+Return exec $edit
riverctl map normal $mod V spawn "mpv --ytdl-format=18 "$(wl-paste)""
#bindsym $mod+shift+v exec mpv --ytdl-format=22 "$(wl-paste)"
#bindsym ctrl+space exec killall mako
# Volume Keys
riverctl map normal $mod F1 spawn "pulsemixer --toggle-mute"
riverctl map normal $mod F2 spawn "pulsemixer --change-volume -5"
riverctl map normal $mod F3 spawn "pulsemixer --change-volume +5"
riverctl map normal $mod F4 spawn "playerctl play-pause"
riverctl map normal $mod F5 spawn "playerctl next"
riverctl map normal $mod F6 spawn "playerctl previous"
riverctl map normal XF86AudioPlay spawn "playerctl play-pause"
riverctl map normal XF86AudioNext spawn "playerctl next"
riverctl map normal XF86AudioPrev spawn "playerctl previous"

# connect bluetooth device
riverctl map normal $mod F9 spawn "bluetoothctl -- connect 00:16:94:2C:72:30"
# Mod+Shift+Return to start an instance of alacritty
riverctl map normal $mod+Shift Return spawn kitty

# Mod+Q to close the focused view
riverctl map normal $mod Q close

# Mod+E to exit river
riverctl map normal $mod+Shift E exit

# Mod+J and Mod+K to focus the next/previous view in the layout stack
riverctl map normal $mod J focus-view next
riverctl map normal $mod K focus-view previous

# Mod+Period and Mod+Comma to focus the next/previous output
riverctl map normal $mod Period focus-output next
riverctl map normal $mod Comma focus-output previous

# Mod+Shift+{Period,Comma} to send the focused view to the next/previous output
riverctl map normal $mod+Shift Period send-to-output next
riverctl map normal $mod+Shift Comma send-to-output previous

# Mod+Return to bump the focused view to the top of the layout stack, making
# it the new master
riverctl map normal $mod Return zoom

# Mod+H and Mod+L to decrease/increase the width of the master column by 5%
riverctl map normal $mod H mod-master-factor -0.05
riverctl map normal $mod L mod-master-factor +0.05

# Mod+Shift+H and Mod+Shift+L to increment/decrement the number of
# master views in the layout
riverctl map normal $mod+Shift H mod-master-count +1
riverctl map normal $mod+Shift L mod-master-count -1

# Mod + Left Mouse Button to move views
riverctl map-pointer normal $mod BTN_LEFT move-view

# Mod + Right Mouse Button to resize views
riverctl map-pointer normal $mod BTN_RIGHT resize-view

for i in $(seq 1 9); do
    tagmask=$((1 << ($i - 1)))

    # Mod+[1-9] to focus tag [0-8]
    riverctl map normal $mod $i set-focused-tags $tagmask

    # Mod+Shift+[1-9] to tag focused view with tag [0-8]
    riverctl map normal $mod+Shift $i set-view-tags $tagmask

    # Mod+Ctrl+[1-9] to toggle focus of tag [0-8]
    riverctl map normal $mod+Control $i toggle-focused-tags $tagmask

    # Mod+Shift+Ctrl+[1-9] to toggle tag [0-8] of focused view
    riverctl map normal $mod+Shift+Control $i toggle-view-tags $tagmask
done

# Mod+0 to focus all tags
# Mod+Shift+0 to tag focused view with all tags
all_tags_mask=$(((1 << 32) - 1))
riverctl map normal $mod 0 set-focused-tags $all_tags_mask
riverctl map normal $mod+Shift 0 set-view-tags $all_tags_mask

# Mod+Space to toggle float
riverctl map normal $mod Space toggle-float

# Mod+F to toggle fullscreen
riverctl map normal $mod F toggle-fullscreen

# Mod+{Up,Right,Down,Left} to change master orientation
riverctl map normal $mod Up layout rivertile top
riverctl map normal $mod Right layout rivertile right
riverctl map normal $mod Down layout rivertile down
riverctl map normal $mod Left layout rivertile left

# Mod+S to change to Full layout
riverctl map normal $mod S layout full

# Declare a passthrough mode. This mode has only a single mapping to return to
# normal mode. This makes it useful for testing a nested wayland compositor
riverctl declare-mode passthrough

# Mod+F11 to enter passthrough mode
riverctl map normal $mod F11 enter-mode passthrough

# Mod+F11 to return to normal mode
riverctl map passthrough $mod F11 enter-mode normal

# Set the layout on startup
riverctl layout rivertile left

# Set app-ids of views which should float
riverctl float-filter-add "float"
riverctl float-filter-add "popup"

# Set app-ids of views which should use client side decorations
riverctl csd-filter-add "gedit"
