if (( ! $+commands[just] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `just`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_just" ]]; then
  typeset -g -A _comps
  autoload -Uz _just
  _comps[just]=_just
fi

just --completions zsh 2> /dev/null >| "$ZSH_CACHE_DIR/completions/_just" &|
