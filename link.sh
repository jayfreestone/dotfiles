#!/bin/bash
#####################
# link.sh
# Handles the creation of symlinks
####################

# Variables

dir=~/dotfiles # dotfiles directory
files="hushlogin tmux.conf bash_profile agignore eslintrc gitignore scss-lint.yml ctags tern-project hyper.js" # files to symlink

# Symlink Creation

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
