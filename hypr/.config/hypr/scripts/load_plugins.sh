#!/bin/bash

FILES=/home/cooper/.config/hypr/plugins/*.so

for plugin in $FILES
do
    hyprctl plugin load $plugin
done

