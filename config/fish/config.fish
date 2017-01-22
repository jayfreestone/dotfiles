set fish_greeting ""

set -g -x PATH /usr/local/bin $PATH

# note: this erases the default fish_mode_prompt, which adds a vi mode
# indicator to the left of your prompt
function fish_mode_prompt; end

# turn on vi mode when the shell starts
fish_vi_key_bindings
