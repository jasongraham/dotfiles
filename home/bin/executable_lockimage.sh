#!/usr/bin/env bash

set -eu -o pipefail

_OUTPUT_ITER=$(hyprctl -j monitors | jq -r ".[].name")

cleanup() {
    for OUTPUT in $_OUTPUT_ITER ; do
        rm -f /tmp/"$OUTPUT".png
    done
}

trap "cleanup" EXIT

for OUTPUT in $_OUTPUT_ITER ; do
    IMAGE=/tmp/$OUTPUT.png
    grim \
        -o "${OUTPUT}" \
        -l 0 \
        "${IMAGE}"
done

hyprlock
