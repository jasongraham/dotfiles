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
    case $dir in
        *aurto)
            echo "Cleaning old packages from $dir"
            # Keep latest version of everything, even if not installed.
            # Use aurto to manage removing unwanted packages from here.
            pkgcacheclean \
                --all-as-installed \
                --verbose \
                --human-readable \
                --cachedir "$dir" \
                $KEEP_PACKAGES
            ;;
        *)
            echo "Cleaning old and uninstalled packages from $dir"
            pkgcacheclean \
                --verbose \
                --human-readable \
                --cachedir "$dir" \
                $KEEP_PACKAGES
    esac
done
