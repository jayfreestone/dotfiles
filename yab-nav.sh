#!/bin/sh

# Finds nearest display based on next/prev
case "${1}" in
  next)
    step=1
    ;;
  prev)
    step=-1
    ;;
  *)
    echo >&2 "ERROR: must provide an argument 'next' or 'prev'!"
    exit 1
    ;;
esac

jq -nr \
  --argjson displays "$(yabai -m query --displays)" \
  --argjson focused "$(yabai -m query --displays --display)" \
  --argjson step "$step" \
  '$displays
    | sort_by(.frame.x)
    | .[index($focused) + if (index($focused) + $step) < 0 then 0 else $step end].index // $focused.index'
