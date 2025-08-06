#!/bin/bash

set -eu -o pipefail

readonly FILE="/tmp/weather_cached"
readonly INTERVAL_MIN=900  # seconds
readonly INTERVAL_MAX=1800  # seconds

trap 'notify-send -u normal "weather wttr fetch" "exited unexpectedly"' EXIT

while ! systemctl -q is-active network-online.target ; do
    sleep 1
done

while true; do
    if ! curl wttr.in/?format=1 --silent --output "$FILE" ; then
        # Don't exit on a curl failure, but do notify
        notify-send -u normal "weather wttr fetch" "curl error"
    else
        # Include time to see how stale the reading is
        truncate -s-1 "$FILE"
        echo -n " @ " >> "$FILE"
        date -r "$FILE" "+%I:%M%p" >> "$FILE"
    fi
    # Regardless, try again later
    sleep "$((RANDOM % (INTERVAL_MAX-INTERVAL_MAX+1)+INTERVAL_MIN))"
done
