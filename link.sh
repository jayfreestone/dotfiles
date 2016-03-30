#!/bin/bash
#####################
# link.sh
# Handles the creation of symlinks
####################

# Variables

dir=~/dotfiles # dotfiles directory
files="bash_profile agignore eslintrc gitignore scss-lint.yml ctags tern-project" # files to symlink

# Symlink Creation

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
