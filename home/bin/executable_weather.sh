#!/bin/bash
# TODO: The "lock" file check and creation is not atomic, and does not ensure
# only a single instance of this script is running.

set -eu -o pipefail

readonly FILE="/tmp/weather_cached"
readonly INTERVAL=600  # seconds

while ! systemctl -q is-active network.target ; do
    sleep 1
done

[ -f "$FILE" ] && \
    notify-send -u normal "weather wttr fetch" "cache file already exists" && \
    exit

while true; do
    curl wttr.in/?format=1 --silent --output "$FILE"
    sleep "$INTERVAL"
done
