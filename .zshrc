# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DEFAULT_USER=jfree

# Source externals
source /Users/jfree/dotfiles/.functions
source /Users/jfree/dotfiles/.aliases
source /Users/jfree/.ssh/.ssha

#Powerline
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=arrow

#Vim KB
bindkey -v

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx vagrant vundle vi-mode zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/Users/jfree/pear/bin:/usr/local:/usr/local/bin:/usr/local/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/MacGPG2/bin:/usr/local/bin:$PATH


 echo " _  _      _     _ ____ 	"
 echo "| || |__ _| |___(_)__  |		User : `whoami`"
 echo "| __ / _\` | |___| | / / 		Kernel : `uname -sr`"
 echo "|_||_\__,_|_|   |_|/_/  		Disk : `df -h | grep /dev/disk0s2 |awk '{print $3"/"$2}'`"
 echo ""


