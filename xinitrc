#!/bin/bash

# Source scripts in /etc/X11/xinit/xinitrc.d/ (ie, dbus)
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xsetroot -cursor_name left_ptr
xmodmap $HOME/.xmodmap
if [ $HOSTNAME = "jrg-thinkpad" ] ; then
    exec ck-launch-seesion gnome-session
else
    # turn off energy star feature of screen
    xset -dpms

    # turn off screen saver
    xset s 0 0

    xrdb -merge $HOME/.Xresources
    xcompmgr -c &
    thunar --daemon &
    $HOME/bin/wallpaper.sh &
    #exec ck-launch-session dbus-launch xmonad
    $HOME/bin/export_x_info.sh
    exec ck-launch-session xmonad
fi
