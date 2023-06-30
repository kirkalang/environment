# environment
Personal & portable ZSH environment

# Pre-requisites

* [XCode Command Line Developer Tools](https://mac.install.guide/commandlinetools/index.html)

* [Homebrew](https://docs.brew.sh/Installation)
  * Verify the command to add the Homebrew path in the local environment matches the command in .zshrc
  * Example: ` (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"')` the path to brew should match.
  * If it doesn't match update the path in .zshrc.
 
## Option pre-requisites

* NVM
  * [Install with Homebrew](https://tecadmin.net/install-nvm-macos-with-homebrew/)
  * Probably need to install a version of node, the LTS. Using `node install --lts`
  * Another useful tool for handling projects with different node version is direnv. `brew install direnv`
