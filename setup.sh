#!/bin/bash

FILES=("ctags=.ctags" "gitignore_global=.gitignore_global" "vimrc=.vimrc")

# Get GO from user
echo "This script will remove and link dotfiles in $HOME!"
read -p "Do you want to continue? (y/N)? "
[ "$(echo $REPLY | tr [:upper:] [:lower:])" == "y" ] || exit
echo ""

# Do all linking
for item in ${FILES[*]}
do
    source=`echo "$item" | cut -d'=' -f1`
    target=`echo "$item" | cut -d'=' -f2`
    echo "$source -> $HOME/$target"
    rm -f $HOME/$target
    ln -s `pwd`/$source $HOME/$target
done

echo ""
echo "Done"
