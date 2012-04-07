#!/bin/bash
# This is a script to symlink all of the configuration files found in this
# repository into the user's home directory.

for f in `ls | egrep -v 'setup|Readme'`; do

    # remove old config files, replace with links to here
    rm $HOME/.$f
    ln -s $PWD/$f $HOME/.$f

done

