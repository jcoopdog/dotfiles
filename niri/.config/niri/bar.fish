#!/usr/bin/env fish

# globals 
set BATTERY_PATH /sys/class/power_supply/BAT0/
set AC_PATH /sys/class/power_supply/AC/
set COLUMNS (tput cols)
set battery_notify 100

set val_color 33b1ff
set icon_color dde1e6
set grey_color 525252
set charging_color 42be65
set discharging_color ee5396

function sep
    echo -en -- "$(set_color $grey_color) | $(set_color normal)"
end

function battery
    set -f battery (cat $BATTERY_PATH/capacity)
    set battery_charging (cat $AC_PATH/online)
    if test $battery_charging -eq 0
        if test $battery -le 5 -a $battery_notify -gt 5
            set battery_notify 5
            notify-send -u critical -i batery "Battery Low!" "Battery charge is currently at $battery"
        else if test $battery -le 10 -a $battery_notify -gt 10
            set battery_notify 10
            notify-send -u critical -i batery "Battery Low!" "Battery charge is currently at $battery"
        else if test $battery -le 15 -a $battery_notify -gt 15
            set battery_notify 15
            notify-send -u normal -i batery "Battery Low(ish)!" "Battery charge is currently at $battery"
        end
    else
        set battery_notify $battery
    end
    if test $battery_charging -eq 1
        set battery (set_color $charging_color)+(set_color $val_color)$battery
    else
        set battery (set_color $discharging_color)-(set_color $val_color)$battery
    end
    set battery $battery(set_color $icon_color)%(set_color normal)
    echo -en -- "$battery"
end

function datetime
    set -f date (date +'%m') (date +'%d') (date +'%y')
    set -f date (set_color $val_color)(string join -- "$(set_color $icon_color)/$(set_color $val_color)" $date)
    set -f time (date +'%H') (date +'%M') (date +'%S')
    set -f time (set_color $val_color)(string join -- "$(set_color $icon_color):$(set_color $val_color)" $time)
    echo -en -- "$date $time$(set_color normal)"
end

# function network
#     set -f network
#     set -f wpa_status (wpa_cli status)
#     set -f ssid (string match -g --regex '^ssid=(.*)' $wpa_status)
#     or set network $(set_color $grey_color)disconnected$(set_color normal)
#     and set network (set_color $val_color)$ssid(set_color normal)
#     if test (string match -g --regex '^wpa_state=(.*)' $wpa_status | string collect -a) = INTERFACE_DISABLED
#         set network $(set_color $grey_color)off$(set_color normal)
#     end
#     echo -en -- "$network"
# end

function network
    set -f network
    set -f iwd_status (iwctl station wlan0 show 2>&1)
    if string match -q --regex 'device' $iwd_status
        set network (set_color $grey_color)off(set_color normal)
    else if string match -q --regex 'disconnected' $iwd_status
        set network (set_color $grey_color)disconnected(set_color normal)
    else
        set network (set_color $val_color)(string match -g --regex 'Connected network\s*(\S*)' $iwd_status)(set_color normal)
    end
    echo -en -- "$network"
end

function brightness
    set -f brightness (math -s0 "$(brightnessctl g) / $(brightnessctl m) * 100")
    set brightness (set_color $val_color)$brightness(set_color $icon_color)󰳲(set_color normal)
    echo -en -- "$brightness"
end

function volume

    set -f vol (wpctl get-volume @DEFAULT_SINK@)
    if string match -e "MUTED" $vol >/dev/null
        set -f muted true
    else
        set -f muted false
    end
    set vol (echo $vol | awk '{print $2}')
    set vol (math -s0 "$vol * 100")
    if $muted
        set -f volicon 󰝟
    else if test $vol -ge 50
        set -f volicon 󰕾
    else if test $vol -gt 0
        set -f volicon 󰖀
    else
        set -f volicon 󰕿
    end
    set vol (set_color $val_color)$vol
    set volicon (set_color $icon_color)$volicon(set_color normal)
    set -f volume "$vol$volicon"
    echo -en -- "$volume"
end

function title
    set -f title (niri msg focused-window)
    set title (string match -g --regex '"(.*)"' $title)
    set title $title[1]
    echo -en -- "$title"
end

function tray
    set -f num_icons 0
    # if pgrep -x vesktop >/dev/null
    if flatpak ps | grep "Vesktop" >/dev/null
        set out $out ""
        set num_icons (math $num_icons + 1)
    end
    # if pgrep -x steam >/dev/null
    if flatpak ps | grep "Steam" >/dev/null
        set out $out ""
        set num_icons (math $num_icons + 1)
    end
    if test $num_icons > 0
        echo -en -- (set_color $icon_color)(string join -- "  " $out)
    end
end


function bar
    echo -en -- '\e[?25l'
    while true

        set left (title)
        set right (tray) (volume) (brightness) (battery) (network) (datetime)

        set right " $(string join -- (sep) $right) "
        set col (math $COLUMNS - (string length --visible -- $right) + 1)
        set left " $(string shorten --char (sep) --max (math $col - 2 - (string length --visible (sep))) $left)"

        echo -en -- "\e[2K\e[0G"$left"\e["$col"G"$right

        sleep 1
    end
end

argparse 'b/bar' -- $argv

if set -ql _flag_bar
    bar
else
    kitty +kitten panel --edge=bottom -o font_size=15.0 (status filename) --bar
end
