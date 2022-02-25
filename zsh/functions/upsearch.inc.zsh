#!/usr/bin/env zsh

function upsearch () {
    test / == "$PWD" && return || test -e "$1" && echo "found: " "$PWD" && return || cd .. && upsearch "$1"
}
