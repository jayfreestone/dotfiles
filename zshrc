#export PATH=/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/local/sbin:$PATH

source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

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

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# go
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# composer
export PATH=$PATH:$HOME/.composer/vendor/bin

# Vi mode
bindkey -v

# Aliases
alias ls='ls -Glah'
alias mkdir='mkdir -pv'
## Tig
alias tigme='tig --author="\(jay.freestone\)\|\(mail@jayfreestone.com\)"'
## Override zsh git plugin with fzf helper (faster)
#alias gco='fbr'
#alias gmb='fbrm'
## Prefer commitizen
alias gc='git cz'
# Prefer non-permanent delete
alias rm='trash'

# Find and merge branch
fbrm() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git merge $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

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
