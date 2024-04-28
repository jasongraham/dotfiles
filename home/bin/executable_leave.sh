#!/bin/bash

choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" | rofi -dmenu -i)
if [[ $choice == "Lock" ]];then
    lockimage.sh
elif [[ $choice == "Logout" ]];then
    pkill -KILL -u "$USER"
elif [[ $choice == "Suspend" ]];then
    systemctl suspend
elif [[ $choice == "Reboot" ]];then
    systemctl reboot
elif [[ $choice == "Shutdown" ]];then
    systemctl poweroff
fi
