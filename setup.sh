#!/bin/bash
# This is a script to symlink all of the configuration files found in this
# repository into the user's home directory.

for f in * ; do

    # don't link this script
    if [ "$f" == $0 ] ; then
        continue
    fi

    # remove old config files, replace with links to here
    rm $HOME/.$f
    ln -s $PWD/$f $HOME/.$f

done

