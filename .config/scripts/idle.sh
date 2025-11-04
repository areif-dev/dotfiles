#!/usr/bin/env bash 

# Lock the screen after 2 minutes of inactivity. Turn the monitor off and suspend power after 20 minutes
swayidle -w timeout 600 'swaylock -f -c 000000 && hyprctl dispatch dpms off' \
    resume 'hyprctl dispatch dpms on && $HOME/.config/scripts/monitor-scale.sh' \
    before-sleep 'swaylock -f -c 000000' 

