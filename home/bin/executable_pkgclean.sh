#!/bin/bash

# Run pkgcacheclean on all dirs under /var/cache/pacman

set -eu -o pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

for dir in /var/cache/pacman/* ; do
    echo "####################################################################"
    echo "Cleaning $dir"
    pkgcacheclean --verbose --cachedir "$dir"
done
