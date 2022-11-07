# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt null_glob

fpath=(~/dotfiles/zsh/completion $fpath)

# source antidote
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

# initialize plugins statically
antidote load

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Required for z to work
  source `brew --prefix`/etc/profile.d/z.sh
fi

autoload -Uz compinit && compinit -i

export EDITOR=vim
export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR

setopt inc_append_history
setopt hist_ignore_all_dups

# Ensures that glob failures don't cause the
# command to be aborted, meaning that the
# caret (^) works as expected
# https://stackoverflow.com/questions/6091827/git-show-head-doesnt-seem-to-be-working-is-this-normal
setopt NO_NOMATCH

# Set GUI editor
export GUI_EDITOR="IntelliJ\ IDEA\ Ultimate"

# Vi mode
bindkey -v '^?' backward-delete-char
# https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode
# bindkey -mv
# 10ms for key sequences
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
KEYTIMEOUT=1

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.fzf.zsh ]; then
  export FZF_DEFAULT_OPTS=--inline-info
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules}/*"'
  # To apply the command to CTRL-T as well
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  source ~/.fzf.zsh
  # Re-bind to match most modern editors
  bindkey '\C-p' fzf-file-widget
  # MacOS doesn't use Alt in terminal, so re-bind
  bindkey '\C-o' fzf-cd-widget
fi

if which direnv > /dev/null; then
  # Set up direnv
  eval "$(direnv hook zsh)"
fi

# node (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ruby (rvm)
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# Load aliases
source ~/dotfiles/zsh/aliases.inc.zsh;

# Load custom executable functions
for file in ~/dotfiles/zsh/functions/*.inc.zsh; do
  source "$file"
done

# Load in custom configs
for file in ~/dotfiles/zsh/conf.d/*.inc.zsh; do
  source "$file"
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
