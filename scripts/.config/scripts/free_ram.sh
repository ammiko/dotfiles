notify-send "Used: $(free -h | awk 'FNR == 2 {print $3}')"
