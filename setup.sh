#!/bin/bash
# This is a script to symlink all of the configuration files found in this
# repository into the user's home directory.

# Get the directory name of the setup script
DIR="$( cd "$(dirname "$0")" && pwd)"

pushd $DIR > /dev/null

for f in `ls | egrep -v 'setup|Readme'`; do

    # remove old config files, replace with links to here
    rm $HOME/.$f
    ln -s $DIR/$f $HOME/.$f

done

popd > /dev/null
