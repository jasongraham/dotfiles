#!/bin/bash

set -eu -o pipefail

check_failure() {
    local rv=$?
    if [[ $rv -ne 0 ]] ; then
        notify-send "Errors during river autostart.sh"
    fi
    exit $rv
}

trap "check_failure" EXIT

# For each service below, kill and then restart to avoid multiple instances running

# Start up mako first to support error messages sending above.
pkill -f mako || true
mako &

pkill -f kanshi || true
kanshi &

pkill -f wpaperd || true
wpaperd -d &

pkill -f waybar || true
waybar -c "$HOME/.config/waybar/river/config.jsonc" -s "$HOME/.config/waybar/river/style.css" &

pkill -f wlsunset || true
wlsunset -l 46.7 -L -117.2 -T 4800 -t 3700 &

pkill -f swayidle || true
swayidle -w \
     timeout 600 "$HOME/bin/lockimage.sh" \
     timeout 900 'wlopm --off \*' \
     resume 'wlopm --on \*' \
     before-sleep "$HOME/bin/lockimage.sh" \
     &

pkill -f wayland-pipewire-idle-inhibit || true
wayland-pipewire-idle-inhibit &
