#!/bin/bash

# Source scripts in /etc/X11/xinit/xinitrc.d/ (ie, dbus)
# Needed to grab certain environmental variables
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if [ -x /usr/bin/gnome-keyring-daemon ] ; then
    eval $( /usr/bin/gnome-keyring-daemon --start --components=gpg,pks11,secrets,ssh )
    export SSH_AUTH_SOCK
    export GPG_AGENT_INFO
    export GNOME_KEYRING_CONTROL
    export GNOME_KEYRING_PID
fi

session=${1:-xmonad}

if [ -L $HOME/.config/systemd/user/default.target ] ; then
    # Systemd user session is setup, use that
    /usr/lib/systemd/systemd --user

else # No systemd user session available
    xsetroot -cursor_name left_ptr
    xmodmap $HOME/.xmodmap

    # turn off energy star feature of screen
    xset -dpms
    # turn off screen saver
    xset s 0 0

    xrdb -merge $HOME/.Xresources
    thunar --daemon &
    # daemonize urxvt
    /usr/bin/urxvtd -q -o -f
    $HOME/bin/wallpaper.sh &
    redshift -l 46.7:-117.2 -t 4800:3700 -b 1.0:0.85 &
    $HOME/bin/export_x_info.sh
    case $session in
        /usr/bin/openbox-session )
            tint2 &
            exec openbox-session ;;
        * )
            exec xmonad ;;
    esac
fi
