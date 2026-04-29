# Load secrets (tokens — not tracked in git)
[[ -f ~/.secrets.zsh ]] && source ~/.secrets.zsh

export PATH="/opt/homebrew/bin:$PATH"

# Node — NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  asdf
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin:$PATH"
