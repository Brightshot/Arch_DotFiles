#!/bin/bash

decision=$(printf " ⏻ power-off\n  restart\n  lock\n  sleep\n  logout" | wofi -c ~/.config/wofi/config_menu -s wofi/menu.css -b | awk {'print $2'} )

case "$decision" in
  "power-off") systemctl poweroff ;;
    "restart") systemctl reboot ;;
    "lock") hyprlock ;;
    "sleep") systemctl suspend ;;
    "logout") $(exit) ;;
    *) echo "error!!" ;;
esac

