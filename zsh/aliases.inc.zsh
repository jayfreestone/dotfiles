# Aliases
alias ls='ls -Glah'
alias mkdir='mkdir -pv'
alias grd='cd $(git rev-parse --show-toplevel)'
alias gfd='git rev-list -n 1 HEAD --' # find the commit that deleted a file
alias fza='git ls-files -m -o --exclude-standard | fzf --print0 -m | xargs -0 -t -o git add'

# macOS specific
alias y="open -a Yoink"

# Docker
alias dc='docker-compose'
compdef dc='docker-compose'
