# Remove existing alias first to avoid PL10k warnings.
gcob() {
  _fzf_git_each_ref --no-multi | xargs git checkout
}

gswt() {
  cd "$(_fzf_git_worktrees --no-multi)"
}

#####
# Fix vi-mode + zsh
#####

# Set keybindings for zsh-vi-mode insert mode
function zvm_after_init() {
    zvm_bindkey viins "^P" up-line-or-beginning-search
    zvm_bindkey viins "^N" down-line-or-beginning-search
    for o in files branches tags remotes hashes stashes each_ref; do
        eval "zvm_bindkey viins '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey viins '^g${o[1]}' fzf-git-$o-widget"
    done
}

# Set keybindings for zsh-vi-mode normal and visual modes
function zvm_after_lazy_keybindings() {
    for o in files branches tags remotes hashes stashes each_ref; do
        eval "zvm_bindkey vicmd '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey vicmd '^g${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey visual '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey visual '^g${o[1]}' fzf-git-$o-widget"
    done
}
