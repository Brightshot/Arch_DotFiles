#!/bin/bash 

paths=(\
  "$HOME/.config/wofi" \
  "$HOME/.config/waybar" \
  "$HOME/.config/kitty" \
  "$HOME/.config/hypr" \
  "/etc/dunst" \
)

for folder in "${paths[@]}" ; do
  yes | sudo cp -rf $folder ./

  if [ $? -eq 0 ];then
    echo "$folder copied successfully"
  else
    printf "error\n"
  fi
done
