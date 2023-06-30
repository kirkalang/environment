#!/bin/zsh

export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

"Configure nvm. Set NVM_DIR."
export NVM_DIR="$HOME/.nvm"
print -P "%F{yello}Run nvm.sh from /opt/homebrew/opt/nvm/nvm.sh%f"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
print -P "%F{yellow}Load nvm bash_completion by running /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm%f"
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
