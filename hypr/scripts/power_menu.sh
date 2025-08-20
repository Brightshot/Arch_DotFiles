#!/bin/bash

decision=$(printf "⏻\n\n\n\n\n" | wofi -c ~/.config/wofi/config_menu_2 -s wofi/menu_2.css  | awk {'print $1'} )

case "$decision" in
  "⏻") systemctl poweroff ;;
    "") systemctl reboot ;;
    "") hyprlock ;;
    "") systemctl suspend ;;
    "") $(exit) ;;
    *) echo $? ;;
esac

