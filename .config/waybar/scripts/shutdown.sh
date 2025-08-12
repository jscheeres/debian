#!/bin/bash

CHOICE=$(wofi --dmenu --width 200 --height 300 --prompt "Power" --lines 5 <<EOF
 Lock
🔁 Reboot
⏻ Shutdown
🚪 Logout
❌ Cancel
EOF
)

case "$CHOICE" in
  " Lock") swaylock ;;
  "🔁 Reboot") systemctl reboot ;;
  "⏻ Shutdown") systemctl poweroff ;;
  "🚪 Logout") swaymsg exit ;;
  "❌ Cancel") exit ;;
esac
