#!/bin/bash

# Run pkgcacheclean on all dirs under /var/cache/pacman

set -eu -o pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

readonly KEEP_PACKAGES=2

for dir in /var/cache/pacman/* ; do
    echo "####################################################################"
    OPTS=( \
        --verbose \
        --human-readable \
        --cachedir "$dir" \
    )
    case $dir in
        *aurto)
            # Keep latest version of everything, even if not installed.
            echo "Cleaning old packages from $dir"
            OPTS=("${OPTS[@]}" --all-as-installed)
            ;;
        *)
            echo "Cleaning old and uninstalled packages from $dir"
    esac
    pkgcacheclean "${OPTS[@]}" $KEEP_PACKAGES
done
