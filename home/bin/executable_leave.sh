#!/bin/bash
# Logout script for use with rofi

set -eu -o pipefail

readonly DESKTOP=${XDG_SESSION_DESKTOP:-sway}

_EXEC="swaymsg exec"
_EXIT="swaymsg exit"

if [ "$DESKTOP" = "river" ]; then
    _EXEC="riverctl spawn"
    _EXIT="riverctl exit"
fi

choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" | rofi -dmenu -i)
if [[ $choice == "Lock" ]];then
    $_EXEC "$HOME/bin/lockimage.sh"
elif [[ $choice == "Logout" ]];then
    $_EXIT
elif [[ $choice == "Suspend" ]];then
    systemctl suspend
elif [[ $choice == "Reboot" ]];then
    systemctl reboot
elif [[ $choice == "Shutdown" ]];then
    systemctl poweroff
fi
