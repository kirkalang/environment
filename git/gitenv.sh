#!/bin/zsh

# Check if nvm command is installed or runnable
if ! command -v git &> /dev/null; then
    exit 1
fi

# Git command line autocompletion
autoload -Uz compinit && compinit

# Show current branch name in the command prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
zstyle ':vcs_info:git:*' formats '%b'
