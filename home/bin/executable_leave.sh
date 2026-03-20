#!/bin/bash
# Logout script for use with wofi

set -eu -o pipefail

# Don't open if another instance of wofi is running
pidof wofi && exit

choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" | wofi --show=dmenu -i)
if [[ $choice == "Lock" ]];then
    hyprctl dispatch exec hyprlock
elif [[ $choice == "Logout" ]];then
    hyprshutdown --top-label "Logging out..."
elif [[ $choice == "Suspend" ]];then
    systemctl suspend
elif [[ $choice == "Reboot" ]];then
    hyprshutdown --top-label "Rebooting..." --post-cmd "systemctl reboot"
elif [[ $choice == "Shutdown" ]];then
    hyprshutdown --top-label "Shutting down..." --post-cmd "systemctl poweroff"
fi
