#/usr/bin/env bash

battery_notify=100
while true; do
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    battery_charging=$(cat /sys/class/power_supply/ACAD/online)
    if [ $battery_charging -eq 0 ]; then
        if [ $battery -le 5 -a $battery_notify -gt 5 ]; then
            battery_notify=5
            notify-send -u critical -i void-logo-notext "Battery Low!" "Battery charge is currently at $battery"
        elif [ $battery -le 10 -a $battery_notify -gt 10 ]; then
            battery_notify=10
            notify-send -u critical -i void-logo-notext "Battery Low!" "Battery charge is currently at $battery"
        elif [ $battery -le 15 -a $battery_notify -gt 15 ]; then
            battery_notify=15
            notify-send -u normal -i void-logo-notext "Battery Low(ish)!" "Battery charge is currently at $battery"
        fi
    else
        battery_notify=$battery
    fi


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
    sleep 1
done
