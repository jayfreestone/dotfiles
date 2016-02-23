export CLICOLOR=1
set -o vi

export MAMP_PHP=/Applications/MAMP/bin/php/php5.6.10/bin
export PATH="$MAMP_PHP:$PATH"

PATH="$PATH:/Applications/MAMP/Library/bin/"
PATH=$PATH:~/.composer/vendor/bin
PATH=$PATH:~/wpcs/vendor/bin
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Use ag instead of the default find command for listing candidates.
# - The first argument to the function is the base path to start traversal
# - Note that ag only lists files not directories
# - See the source code (completion.{bash,zsh}) for the details.

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

_fzf_compgen_path() {
	  # Feed the output of ag into fzf
	  ag -g "" | fzf

  }

# Includes
source ~/dotfiles/aliases
source ~/dotfiles/functions
