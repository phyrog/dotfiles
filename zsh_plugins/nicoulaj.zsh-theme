#!/usr/bin/env zsh
# ------------------------------------------------------------------------------
# Prompt for the Zsh shell:
#   * One line.
#   * VCS info on the right prompt.
#   * Only shows the path on the left prompt by default.
#   * Crops the path to a defined length and only shows the path relative to
#     the current VCS repository root.
#   * Wears a different color wether the last command succeeded/failed.
#   * Shows user@hostname if connected through SSH.
#   * Shows if logged in as root or not.
# ------------------------------------------------------------------------------

# Customizable parameters.
PROMPT_PATH_MAX_LENGTH=30
PROMPT_DEFAULT_END=❯
PROMPT_ROOT_END=❯❯❯
PROMPT_SUCCESS_COLOR="%F{071}"
PROMPT_FAILURE_COLOR="%F{124}"
PROMPT_VCS_INFO_COLOR="%F{245}"

# Set required options.
setopt promptsubst

# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info

if [ "$SHLVL" -gt 1 ]; then
  PROMPT_DEFAULT_END=❯❯
fi

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info

# Set vcs_info parameters.
# Check jj before git because of colocated jj repos
zstyle ':vcs_info:*' enable jj hg bzr git
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' actionformats "%S" "%r/%s/%b %u%c%m (%a)"
zstyle ':vcs_info:*:*' formats "%S" "%r/%s/%b %u%c%m"
zstyle ':vcs_info:*:*' nvcsformats "%~" ""

# Define prompts.
PROMPT="%(0?.$PROMPT_SUCCESS_COLOR.$PROMPT_FAILURE_COLOR)${SSH_TTY:+[%n@%m]}%B%$PROMPT_PATH_MAX_LENGTH<..<"'${vcs_info_msg_0_%%.}'"%<<%(!.$PROMPT_ROOT_END.$PROMPT_DEFAULT_END)%b%f "
RPROMPT="$PROMPT_VCS_INFO_COLOR"'$vcs_info_msg_1_'"%f"
