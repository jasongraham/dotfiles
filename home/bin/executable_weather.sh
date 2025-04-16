#!/bin/bash

set -eu -o pipefail

readonly FILE="/tmp/weather_cached"
readonly INTERVAL=600  # seconds

[ -f "$FILE" ] && \
    notify-send -u normal "weather wttr fetch" "cache file already exists" && \
    exit

while true; do
    curl wttr.in/?format=1 --silent --output "$FILE"
    sleep "$INTERVAL"
done
