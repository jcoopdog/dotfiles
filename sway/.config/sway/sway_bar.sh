#/usr/bin/env bash

battery=$(cat /sys/class/power_supply/BAT0/capacity)
battery_charging=$(cat /sys/class/power_supply/AC/online)
if [ $battery_charging -eq 1 ]; then
    battery=+$battery
else
    battery=-$battery
fi

datetime=$(date +"%D %T")

ssid=$(wpa_cli status | grep "^ssid" | cut -d= -f2)
[ -z $ssid ] && ssid=disconnected

g=$(brightnessctl g);
m=$(brightnessctl m);
brightness=$(echo "scale=3;($g/$m)*100" | bc | cut -d'.' -f1 )

volraw=$(wpctl get-volume @DEFAULT_SINK@ | cut -d' ' -f2)
vol=$(echo "scale=3;$volraw*100" | bc | cut -d'.' -f1)

if [ $vol -ge 50 ]; then
    volicon=󰕾
elif [ $vol -gt 0 ]; then
    volicon=󰖀
else
    volicon=󰕿
fi



echo "$vol$volicon | $brightness󰳲 | $battery% | $ssid | $datetime "
