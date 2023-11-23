# Send a macOS notification
notify() {
  osascript -e "display notification \"Complete\" with title \"$1\""
}
