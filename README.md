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

# Setup

After all the prerequisites are installed (probably still missing some above), simply copy zsh/zshenv to $HOME directory and
open a new zsh terminal. There will probably be errors as I am sure this documentation is not complete as a I only update when
setting up a new environment. If you would like create an issue or submit a pull request. 

**Secrets**

If you have API keys or other secrets you want to store in environment variables then place these into a .secrets file in 
$HOME/.secrets. If this file exists it will get sourced. An example is the OPENAI_API_KEY variable that is used by the gpt script.

# Caveats

I use this repo to maintain my own personal development environment. Hence there are aspects that are only useful to me. 
Some examples:

* I typically place a development folder under $HOME for all my dev work and a bin folder with utilities. 
