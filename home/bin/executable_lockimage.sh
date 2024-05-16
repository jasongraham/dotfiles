#!/usr/bin/env bash

set -eu -o pipefail

readonly SPREADVAL="8"
readonly BLURVAL="3x2"
readonly DESKTOP=${XDG_SESSION_DESKTOP:-sway}
LOCKARGS=""
IMAGES=""

cleanup() {
    local rv=$?
    if [[ $rv -ne 0 ]] ; then
        notify-send "Errors during screen lock operation"
    fi
    # shellcheck disable=SC2086
    rm -f $IMAGES
}

trap "cleanup" EXIT

if [ "$DESKTOP" = "river" ] ; then
    _OUTPUT_ITER=$(wlopm -j | jq -r ".[].output")
else
    _OUTPUT_ITER=$(swaymsg -t get_outputs | jq -r ".[].name")
fi

for OUTPUT in $_OUTPUT_ITER ; do
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
