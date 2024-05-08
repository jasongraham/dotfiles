#!/bin/bash
# Logout script for use with rofi

set -eu -o pipefail

choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" | rofi -dmenu -i)
if [[ $choice == "Lock" ]];then
    swaymsg exec $HOME/bin/lockimage.sh
elif [[ $choice == "Logout" ]];then
    swaymsg exit
elif [[ $choice == "Suspend" ]];then
    systemctl suspend
elif [[ $choice == "Reboot" ]];then
    systemctl reboot
elif [[ $choice == "Shutdown" ]];then
    systemctl poweroff
fi
