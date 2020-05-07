#!/bin/bash
#####################
# link.sh
# Handles the creation of symlinks
####################

# Variables

dir=~/dotfiles # dotfiles directory
files="gitconfig gitignore_global ctags.d tern-project hushlogin zsh/zshrc czrc bash_profile chunkwmrc skhdrc rgignore" # files to symlink

# Symlink Creation

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

ln -s $dir/karibinder.json ~/.config/karabiner/karabiner.json
