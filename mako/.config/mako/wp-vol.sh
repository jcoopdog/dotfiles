#!/usr/bin/env bash

#get vol level into percent

vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
if [[ "$vol" =~ "MUTED" ]]; then
    muted=1
else
    muted=0
fi
vol=$(echo "$vol" | awk '{print $2}')
vol=$(echo "( $vol * 100 ) / 1" | bc)

if [ $vol -ge 50 ]; then
    volicon=󰕾
elif [ $vol -gt 0 ]; then
    volicon=󰖀
else
    volicon=󰕿
fi
if [ $muted -eq 1 ]; then
    volicon=󰝟
fi

notify-send -u low -t 1000 -a 'multimedia-change' -h int:value:$vol " ${vol}${volicon}"
