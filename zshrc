source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Required for z to work
source `brew --prefix`/etc/profile.d/z.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    antigen bundle osx
fi

antigen bundle git
antigen bundle docker-compose
antigen bundle gitfast
antigen bundle Seinh/git-prune
antigen bundle atweiden/fzf-extras
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-completions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# prefer nvim as $EDITOR
if which nvim > /dev/null; then
  export EDITOR=nvim
  alias vi=nvim
  alias vim=nvim
else
  export EDITOR=vim
  alias nvim=vim
fi
export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR

# ruby (rvm)
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# composer
export PATH=$PATH:$HOME/.composer/vendor/bin

# Vi mode
bindkey -v

# Aliases
alias ls='ls -Glah'
alias mkdir='mkdir -pv'
alias grd='cd $(git rev-parse --show-toplevel)'
# Prefer commitizen
alias gc='git cz'
## Dirs
alias app='cd /var/application'
## Docker
alias dc='docker-compose'
compdef dc='docker-compose'

# Reset changes on a specific file
grf() {
  git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git checkout
}

# JIRA plugin
# browse etc is annoyingly autocorrected
alias j='nocorrect jira'
# JIRA browse with project prefix
alias jsp='jira sprint'

# Jira list, returns the ticket ID
jl() {
  local projectName
  projectName=($(jira print-project))
  jira list | fzf | sed 's/:.*//'
}

# Jira browse
jb() {
  local projectName
  projectName=($(jira print-project))

  # If issue num is provided, skip search
  if [ "$#" == 1 ]
  then
    jira browse "$projectName"-"$1"
  else
    jira browse $(jl)
  fi
}

# Jira view
jv() {
  local projectName
  projectName=($(jira print-project))

  # If issue num is provided, skip search
  if [ "$#" == 1 ]
  then
    jira view "$projectName"-"$1"
  else
    jira view $(jl)
  fi
}

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.fzf.zsh ]; then
  export FZF_DEFAULT_OPTS=--inline-info
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules}/*"'
  source ~/.fzf.zsh
  # Re-bind to match most modern editors
  bindkey '\C-p' fzf-file-widget
  # MacOS doesn't use Alt in terminal, so re-bind
  bindkey '\C-o' fzf-cd-widget
fi
