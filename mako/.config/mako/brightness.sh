#!/usr/bin/env bash



brightness=$(( $(( $(brightnessctl g) * 100 )) / $(brightnessctl m) ))
brightness=${brightness%.*}

notify-send -u low -t 1000 -a 'multimedia-change' -h int:value:$brightness "$brightness󰳲"
