#!/bin/bash
# Logout script for use with wofi

set -eu -o pipefail

# Don't open if another instance of wofi is running
pidof wofi && exit

choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" | wofi --show=dmenu -i)
if [[ $choice == "Lock" ]];then
    hyprctl dispatch exec "$HOME"/bin/lockimage.sh
elif [[ $choice == "Logout" ]];then
    hyprctl dispatch exit
elif [[ $choice == "Suspend" ]];then
    systemctl suspend
elif [[ $choice == "Reboot" ]];then
    systemctl reboot
elif [[ $choice == "Shutdown" ]];then
    systemctl poweroff
fi
