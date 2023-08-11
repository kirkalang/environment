#!/usr/bin/env zsh

# +------------+
# | NAVIGATION |
# +------------+

setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# +--------+
# | COLORS |
# +--------+

# Override colors
# eval "$(dircolors -b $ZDOTDIR/dircolors)"
export CLICOLOR=1

# +---------+
# | BREW    |
# +---------+

eval "$(/opt/homebrew/bin/brew shellenv)"


# +---------+
# | PYENV   |
# +---------+
# Check if pyenv command is installed or runnable
if command -v pyenv &> /dev/null; then
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi


# +---------+
# | ALIASES |
# +---------+

source $DOTFILES/aliases/aliases


# +---------+
# | SCRIPTS |
# +---------+

source $DOTFILES/zsh/scripts.zsh


# +---------+
# |   VIM   |
# +---------+

mkdir -p $ZVIMRCDIR
cp $DOTFILES/vim/vimrc $ZVIMRCDIR/vimrc


# +-----+
# | GIT |
# +-----+

source $GITENVCONFIG


# +---------+
# | PYENV   |
# +---------+

# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"


# +---------+
# |  Node   |
# +---------+
if [[ -f $NODEENVCONFIG ]] 
then
  source $NODEENVCONFIG
fi

# +---------+
# | SSH     |
# +---------+

eval $(ssh-agent -s)
ssh-add ~/.ssh/github


