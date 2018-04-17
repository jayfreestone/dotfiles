source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# compsys initialization
# autoload -U compinit
# compinit

# Required for z to work
source `brew --prefix`/etc/profile.d/z.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    antigen bundle osx
fi

antigen bundle z
antigen bundle gitfast
antigen bundle Seinh/git-prune
antigen bundle atweiden/fzf-extras
antigen bundle qianxinfeng/zsh-vscode
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Add custom completion
# fpath=(~/.zsh/completion $fpath)

# show completion menu when number of options is at least 2
# zstyle ':completion:*' menu select=2

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# go
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Vi mode
bindkey -v

# Aliases
alias ls='ls -lah'
alias mkdir='mkdir -pv'
# Override zsh git plugin with fzf helper (faster)
alias gco='fbr'
# Prefer commitizen
alias gc='git cz'

# JIRA plugin
# browse etc is annoyingly autocorrected
alias j='nocorrect jira'
# JIRA browse with project prefix
alias jsp='jira sprint'

# Jira list
jl() {
  local projectName
  projectName=($(jira print-project))
  jira list | fzf | sed 's/:.*//'
}

jiraTaskCompletion() {
  local query task
  task=$(jira list | fzf --query "$1") &&
  reply=("$(echo "$task" | cut -d: -f1)")
  # reply=($(echo "$task" | sed 's/:.*//'))
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

compctl -K jiraTaskCompletion jb

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

compctl -K jiraTaskCompletion jv

## Dirs
alias app='cd /var/application'
alias gsi='cd /var/application/GSI'

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.fzf.zsh ]; then
  export FZF_DEFAULT_OPTS=--inline-info
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules}/*"'
  source ~/.fzf.zsh
  # Re-bind to match most modern editors
  bindkey '\C-p' fzf-file-widget
fi

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
