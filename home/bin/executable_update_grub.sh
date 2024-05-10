#!/usr/bin/env bash
#
# This file contains the appropriate commands to update the grub installation
# on jrg-desktop

set -eu -o pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
