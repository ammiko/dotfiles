# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
    exec river -c ~/.config/river/config.sh
fi
