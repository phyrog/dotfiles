#!/usr/bin/env zsh

fpath+=(${ZDOTDIR:-~}/.antidote)
autoload -Uz $fpath[-1]/antidote

antidote update
