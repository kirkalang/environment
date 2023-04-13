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
eval "$(dircolors -b $ZDOTDIR/dircolors)"

# +---------+
# | BREW    |
# +---------+

eval "$(/opt/homebrew/bin/brew shellenv)"


# +---------+
# | PYENV   |
# +---------+

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


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

# +---------+
# | DIRENV  |
# +---------+

#echo "Configure direnv by running  - direnv hook zsh"
#eval "$(direnv hook zsh)"


# +---------+
# | PYENV   |
# +---------+

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# +---------+
# |  Node   |
# +---------+

export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

echo "Configure nvm. Set NVM_DIR."
export NVM_DIR="$HOME/.nvm"
echo "Run nvm.sh from /opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
echo "Load nvm bash_completion by running /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# +---------+
# | DIRENV  |
# +---------+

# place this after nvm initialization!
echo "Run autoload -U add-zsh-hook"
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

eval "$(direnv hook zsh)"

# +---------+
# | SSH     |
# +---------+

eval $(ssh-agent -s)
ssh-add ~/.ssh/gitlab
ssh-add ~/.ssh/github


# +---------+
# | Zapier  |
# +---------+

export NPM_TOKEN=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
export AWS_VAULT_KEYCHAIN_NAME=login
export JIRA_SERVER=zapierorg.atlassian.net
export JIRA_USER=kirk.lang@zapier.com
export JIRA_TOKEN=K8j2PwmUMdI49UqXO4A8E398
export JIRA_ZAPIERACCOUNT_TOKEN=joBNc7IJlavnixJms2IC87D2


# +---------+
# | EDITOR  |
# +---------+

export NEXT_PUBLIC_SPLITIO_DISABLE_DEBUG=true


# +---------+
# | OpenAI  |
# +---------+

export OPENAI_API_KEY=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
