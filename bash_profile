export CLICOLOR=1

# Vim keybindings
set -o vi

# Shorten prompt
export PS1="$ "

# Ensure MAMP PHP is in path
export MAMP_PHP=/Applications/MAMP/bin/php/php5.6.10/bin
export PATH="$MAMP_PHP:$PATH"

# Set vim as editor
export VISUAL=vim
export EDITOR="$VISUAL"

PATH="$PATH:/Applications/MAMP/Library/bin/"
PATH=$PATH:~/.composer/vendor/bin
PATH=$PATH:~/wpcs/vendor/bin
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export FZF_DEFAULT_COMMAND='ag -l -g ""'

# Includes
source ~/dotfiles/aliases
source ~/dotfiles/functions
