#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install more recent versions of some macOS tools.
brew install git
brew install vim --with-override-system-vi --with-lua --with-python@2

# Install other useful binaries.
brew install zsh
brew install tig
brew install antigen
brew install fzf
brew install ripgrep
brew install z

# Remove outdated versions from the cellar.
brew cleanup