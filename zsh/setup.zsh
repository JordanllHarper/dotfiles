# VARIABLES
# config
export XDG_CONFIG_HOME="$HOME/.config"

# editor
export EDITOR="nvim"

# homebrew
export BREW="/opt/homebrew/bin"

# zsh
export ZSH="$XDG_CONFIG_HOME/.oh-my-zsh"
export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
export ZSH_CUSTOM="$ZSH_CONFIG/custom"

# TOOLS 
eval "$(zoxide init zsh)"
eval "$(opam config env)"

# ALIASES
alias nvimcfg='nvim ~/.config/nvim/'
alias cfg="nvim ~/.config/"
alias ndir='nvim ~/notes/'
alias shake="adb emu sensor set acceleration 100:100:100; sleep 1; adb emu sensor set acceleration 0:0:0"

alias db="fvm dart run build_runner build --delete-conflicting-outputs"

alias cdb="fvm flutter clean && fvm dart run build_runner build --delete-conflicting-outputs"

# cli
alias lg="lazygit"
alias ls="eza"
alias cat="bat"
alias grep="rg"

# oh my zsh setup
source "$ZSH_CONFIG/oh-my-zsh-config.zsh"
