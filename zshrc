source /usr/local/share/antigen/antigen.zsh

# Required for z to work
source `brew --prefix`/etc/profile.d/z.sh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

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

# Vi mode
bindkey -v

# Aliases
alias ls='ls -lah'
alias mkdir='mkdir -pv'
# Override zsh git plugin with fzf helper (faster)
alias gco='fbr'
# Prefer commitizen
alias gc='git cz'

## Dirs
alias app='cd /var/application'
alias gsi='cd /var/application/GSI'

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.fzf.zsh ]; then
  export FZF_DEFAULT_OPTS=--inline-info
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
  source ~/.fzf.zsh
  # Re-bind to match most modern editors
  bindkey '\C-p' fzf-file-widget
fi

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
