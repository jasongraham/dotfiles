#!/bin/bash

set -eu -o pipefail

readonly FILE="/tmp/weather_cached"
readonly INTERVAL=600  # seconds

trap 'notify-send -u normal "weather wttr fetch" "exited unexpectedly"' EXIT

while ! systemctl -q is-active network-online.target ; do
    sleep 1
done

while true; do
    curl wttr.in/?format=1 --silent --output "$FILE"
    sleep "$INTERVAL"
done
