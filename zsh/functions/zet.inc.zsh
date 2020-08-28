#!/usr/bin/env zsh

readonly ZETTEL_DIR=~/zettelkasten/zettelkasten.wiki

# Create new zettelkasten note
# Example:
#   zet My Great Note
zet() {
  local title=$@
  # Lowercase it and replace spaces with dashes
  local slugified_title=$(echo ${title:l} | sed 's/ /-/g')
  local note_name="$(date +"%Y%m%d%H%M")-$slugified_title"
  local note_body="ID: $note_name\nTags:\n\n# $title"
  local note_location="$ZETTEL_DIR/$note_name.md"

  echo $note_body > $note_location

  # Open it in IntelliJ
  idea $note_location
}
