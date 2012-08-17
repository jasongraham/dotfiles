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
    echo "Nothing to do"
    # Note: taking care of startup programs within xfce
    #dropboxd &
    #thunar --daemon &
    #xcompmgr &
    #exec startxfce4
else

    # if gnome-keyring is installed, make it useful
    if [ -x `which gnome-keyring-daemon` ] ; then

        # start it
        eval $(`which gnome-keyring-daemon` --start --components=gpg,pkcs11,secrets,ssh)

        # export important env vars
        export SSH_AUTH_SOCK
        export GPG_AGENT_INFO
        export GNOME_KEYRING_CONTROL
        export GNOME_KEYRING_PID
    fi

    # turn off energy star feature of screen
    xset -dpms

    # turn off screen saver
    xset s 0 0

    xrdb -merge $HOME/.Xresources
    thunar --daemon &
    # daemonize urxvt
    /usr/bin/urxvtd -q -o -f
    $HOME/bin/wallpaper.sh &
    #exec ck-launch-session dbus-launch xmonad
    $HOME/bin/export_x_info.sh
    exec ck-launch-session xmonad
fi
