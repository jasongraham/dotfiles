#!/usr/bin/env bash

set -eu -o pipefail

readonly SPREADVAL="8"
readonly BLURVAL="3x2"
LOCKARGS=""
IMAGES=""

trap 'rm -f $IMAGES' EXIT

for OUTPUT in $(swaymsg -t get_outputs | jq -r '.[].name') ; do
    IMAGE=$(mktemp -u --suffix=.png)
    grim \
        -o "${OUTPUT}" \
        -l 1 \
        "${IMAGE}"
    mogrify \
        -spread "${SPREADVAL}" \
        -blur "${BLURVAL}" \
        +noise Gaussian "${IMAGE}"
    LOCKARGS="${LOCKARGS} --image ${OUTPUT}:${IMAGE}"
    IMAGES="${IMAGES} ${IMAGE}"
done

# shellcheck disable=SC2086
swaylock --daemonize $LOCKARGS
