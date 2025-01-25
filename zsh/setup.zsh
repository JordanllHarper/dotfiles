# Checks if an application is installed
# If it is not run `brew install`
install_if_not_exists () {
    command=$(which -s $1)
    if ! command; then
       brew install $2
    fi 
}

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
#zoxide 
install_if_not_exists "zoxide" "zoxide"
eval "$(zoxide init zsh)"

#opam (ocaml)
eval "$(opam config env)"

# fzf
install_if_not_exists "fzf" "fzf"
eval "$(fzf --zsh)"

# Java env
install_if_not_exists "jenv" "jenv"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# oh my zsh 
source "$ZSH_CONFIG/oh-my-zsh-config.zsh"

# ALIASES
# neovim
alias nvimcfg='nvim ~/.config/nvim/'
alias cfg="nvim ~/.config/"
alias ndir='nvim ~/notes/'
alias nv="nvim"

# dev
alias nvimdev="VIMRUNTIME=./runtime ./build/bin/nvim --luamod-dev"
alias nvdev="VIMRUNTIME=./runtime ./build/bin/nvim --luamod-dev"

# android
alias shake="adb emu sensor set acceleration 100:100:100; sleep 1; adb emu sensor set acceleration 0:0:0"

# flutter
alias db="fvm dart run build_runner build --delete-conflicting-outputs"
alias cdb="fvm flutter clean && fvm dart run build_runner build --delete-conflicting-outputs"

# cli
install_if_not_exists "lazygit"
alias lg="lazygit"

# terminal
install_if_not_exists "eza"
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias l='eza -bGF --header --git --color=always --group-directories-first --icons'
install_if_not_exists "bat"
alias cat="bat"
alias grep="rg"

nu
