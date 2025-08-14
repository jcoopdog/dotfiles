#!/bin/bash

BAR_ENABLED=$(hyprctl getoption plugin:hyprbars:enabled | grep int | cut -d' ' -f2)

if [ $BAR_ENABLED -gt 0 ]; then
    hyprctl -r -- keyword plugin:hyprbars:enabled false
else
    hyprctl -r -- keyword plugin:hyprbars:enabled true
fi
