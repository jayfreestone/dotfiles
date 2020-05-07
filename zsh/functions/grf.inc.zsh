# Reset changes on a specific file
grf() {
  git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git checkout
}
