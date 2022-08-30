#!/usr/bin/env bash
ksdiff <(git show "$1") <(git show "$2")
