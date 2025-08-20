#!/bin/bash 

flag=$1

killall wofi >/dev/null 2>&1
killall fuzzel >/dev/null 2>&1

if [[ "$flag" == "n" ]]; then
  wofi --show drun -s ~/wofi/float.css --prompt="launch app." &
elif [[ "$flag" == "r" ]]; then
  wofi --show run -s ~/wofi/float.css --prompt="run command." &
fi
