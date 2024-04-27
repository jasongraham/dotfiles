#!/bin/bash

# Run pkgcacheclean on all dirs under /var/cache/pacman

set -o errexit
set -o pipefail
set -o nounset

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

for dir in /var/cache/pacman/* ; do
    echo "####################################################################"
    echo "Cleaning $dir"
    pkgcacheclean --verbose --cachedir "$dir"
done
