# Git changes since
changessince() {
  git diff "$(git rev-list -n1 --before="$1" master)" -- "$2"
}
