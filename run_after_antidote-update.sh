#!/usr/bin/env zsh

fpath+=(${ZDOTDIR:-~}/.antidote)
autoload -Uz $fpath[-1]/antidote

zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh

antidote update

antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins
