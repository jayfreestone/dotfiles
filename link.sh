#!/bin/bash
#####################
# link.sh
# Handles the creation of symlinks
####################

# Variables

dir=~/dotfiles # dotfiles directory
files="gitignore_global ctags tern-project hushlogin zshrc czrc bash_profile" # files to symlink

# Symlink Creation

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

ln -s $dir/karibinder.json ~/.config/karabiner/karabiner.json
