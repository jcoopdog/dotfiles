#/bin/bash

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
brightness=$(echo "scale=1;($g/$m)*100" | bc | cut -d'.' -f1 )

vol=$(wpctl get-volume @DEFAULT_SINK@)

echo "$brightness󰳲 | $battery% | $ssid | $datetime "
