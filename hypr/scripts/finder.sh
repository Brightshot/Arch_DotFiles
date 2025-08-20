#!/bin/bash 
killall wofi >/dev/null 2>&1

selection=$(find / -type d -name ".*" -prune -o -print 2>/dev/null| fuzzel -d )

if [ -z "$selection" ]; then
  echo "no file selected"
else
  if [ -f "$selection" ]; then
    
    #dynamically launch a file based on its extension
    default=$HOME/.config/mimeapps.list
    if [[ -e "$default" ]]; then
      extension=${selection##*.}
      launcher=$(cat $default | fzf -i --filter=$extension | awk -v RS="" -F '[=;]' '{print $2}' | sed 's/.desktop// ; s/.*\.//')
      exec $launcher "$selection" 2>/dev/null 
    fi

  elif [ -d "$selection" ]; then
    echo " "
    dolphin "$selection" >/dev/null 2>&1 & 
  fi
fi
