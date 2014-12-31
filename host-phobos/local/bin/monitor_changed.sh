#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/chris/.Xauthority

syspath="/sys/devices/pci0000:00/0000:00:02.0/drm/card0"
dp1_connected=`cat $syspath/card0-DP-1/status`

if [[ "$dp1_connected" -eq "connected" ]]; then
    xrandr --output DP1 --auto --left-of eDP1
else
    xrandr --output DP1 --off
fi
