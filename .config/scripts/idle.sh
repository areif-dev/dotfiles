#!/usr/bin/env bash 

suspend_cmd='$HOME/.config/scripts/monitor-power.sh --off && systemctl suspend'
if [ $(hostname) = "desktop" ]; then 
    suspend_cmd='$HOME/.config/scripts/monitor-power.sh --off' 
fi

# Lock the screen after 2 minutes of inactivity. Turn the monitor off and suspend power after 20 minutes
swayidle -w timeout 120 'swaylock -f -c 000000' \
    timeout 1200 $suspend_cmd \
    resume '$HOME/.config/scripts/monitor-power.sh --on && $HOME/.config/scripts/monitor-scale.sh' \
    before-sleep 'swaylock -f -c 000000' 

