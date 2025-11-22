#/usr/bin/env bash --norc

shopt -s checkwinsize; (:) # adds the $LINES and $COLUMNS variables
echo -e '\e[?25l'
battery_notify=100
while true; do
    battery=$(< /sys/class/power_supply/BAT0/capacity)
    battery_charging=$(< /sys/class/power_supply/AC/online)
    if [ $battery_charging -eq 0 ]; then
        if [ $battery -le 5 -a $battery_notify -gt 5 ]; then
            battery_notify=5
            notify-send -u critical -i batery "Battery Low!" "Battery charge is currently at $battery"
        elif [ $battery -le 10 -a $battery_notify -gt 10 ]; then
            battery_notify=10
            notify-send -u critical -i batery "Battery Low!" "Battery charge is currently at $battery"
        elif [ $battery -le 15 -a $battery_notify -gt 15 ]; then
            battery_notify=15
            notify-send -u normal -i batery "Battery Low(ish)!" "Battery charge is currently at $battery"
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

    wpa_status=$(wpa_cli status)
    ssid=$(echo "$wpa_status" | grep "^ssid")
    ssid=${ssid##*=}
    ssid=${ssid:=disconnected}
    [[ $(echo "$wpa_status" | grep "^wpa_state") == "wpa_state=INTERFACE_DISABLED" ]] && ssid=disabled

    brightness=$(( $(( $(brightnessctl g) * 100 )) / $(brightnessctl m) ))
    brightness=${brightness%.*}

    vol=$(wpctl get-volume @DEFAULT_SINK@)
    if [[ $vol =~ 'MUTED' ]]; then
        muted=1
    else
        muted=0
    fi
    vol=${vol#*\ }
    vol=${vol%\ *}
    vol=${vol/\./}
    vol=${vol#0}

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

    title=$(niri msg focused-window | grep Title)
    title=${title#*\"}
    title=${title%\"*}


    if [ $(pgrep -x steam 2>&1 >> /dev/null; echo $?) -eq 0 ]; then
        steam=" | "
    else"
        steam=""
    fi

    left="$title"
    right="   $steam$vol$volicon | $brightness󰳲 | $battery% | $ssid | $datetime "
    col=$(( $COLUMNS - ${#right} + 1 ))
    echo -en '\e[2K'
    echo -en '\e[0G'
    echo -en "$left"
    echo -en "\e[${col}G"
    echo -en "$right"
    sleep 1
done
