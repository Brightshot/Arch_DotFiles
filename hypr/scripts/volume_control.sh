#!/bin/bash 

current_icon=""
is_muted=$()

get(){
  volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
  volume_as_percent=$(awk '{printf("%d", 100 * $2)}' <<< "$volume")
}

get
####Change icon#####
if [ $volume_as_percent -gt 70 ]; then
  current_icon="audio-volume-high"
elif [[ $volume_as_percent -lt 25 && $volume_as_percent -gt 0 ]]; then
  current_icon="audio-volume-low"
elif [ $volume_as_percent -eq 0 ]; then
  current_icon="audio-volume-muted"
else
  current_icon="audio-volume-medium"
fi
####################
#printf "$volume \n $volume_as_percent \n"


if [[ "$1" == "increase" && $volume_as_percent -lt 100 ]];then
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
elif [[ "$1" == "decrease" && $volume_as_percent -gt 0 ]];then
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
fi

get

if [ $volume_as_percent -gt 100 ]; then 
  echo $volume_as_percent
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%
  echo $volume_as_percent
fi

dunstify -a "change volume" -r 2248 " Volume: $volume_as_percent % " \
 -h int:value:$volume_as_percent -i "$current_icon"

#dunstify -a "change" -r 2248 "" -h int:value:$volume_as_percent -i "$current_icon"

