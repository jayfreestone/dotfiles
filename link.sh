#!/bin/bash
#####################
# link.sh
# Handles the creation of symlinks
####################

# Variables

dir=~/dotfiles # dotfiles directory
files="gitignore_global ctags tern-project hyper.js zshrc czrc" # files to symlink

# Symlink Creation

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
