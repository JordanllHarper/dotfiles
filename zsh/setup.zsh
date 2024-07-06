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

# oh my zsh setup
source "$ZSH_CONFIG/oh-my-zsh-config.zsh"

# TOOLS 
eval "$(zoxide init zsh)"
eval "$(opam config env)"
eval "$(oh-my-posh init zsh --config $ZSH_CONFIG/themes/tokyo.omp.json)"
# ALIASES
alias nvimcfg='nvim ~/.config/nvim/'
alias cfg="nvim ~/.config/"
alias ndir='nvim ~/notes/'
# android
alias shake="adb emu sensor set acceleration 100:100:100; sleep 1; adb emu sensor set acceleration 0:0:0"
# flutter
alias db="fvm dart run build_runner build --delete-conflicting-outputs"
alias cdb="fvm flutter clean && fvm dart run build_runner build --delete-conflicting-outputs"

# cli
alias lg="lazygit"
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias l='eza -bGF --header --git --color=always --group-directories-first --icons'
alias cat="bat"
alias grep="rg"
