# Checks if an application is installed
# If it is not run `brew install`
# install_if_not_exists () {
#     command=$(which -s $1)
#     if ! command; then
#        brew install $2
#     fi
# }


# editor
export EDITOR="nvim"

# homebrew
export BREW="/opt/homebrew/bin"

# zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"

# oh my zsh setup
source "$ZSH_CONFIG/oh-my-zsh-config.zsh"

# TOOLS
# zoxide
# install_if_not_exists "zoxide" "zoxide"
eval "$(zoxide init zsh)"

#
#opam (ocaml)
eval "$(opam config env)"

#
# # fzf
# install_if_not_exists "fzf" "fzf"
eval "$(fzf --zsh)"
export FZF_ALT_C_COMMAND=""
export KEYTIMEOUT=1


#
# # Java env
# install_if_not_exists "jenv" "jenv"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# oh my zsh
source "$ZSH_CONFIG/oh-my-zsh-config.zsh"

# neovim
alias nvimcfg='nvim ~/.config/nvim/'
alias cfg="nvim ~/.config/"
alias ndir='nvim ~/notes/'
alias nv="nvim"
alias nvt='nvim +"lua vim.cmd([[SplitTerm]]); vim.cmd([[wincmd k]])"'

# dev
alias nvimdev="VIMRUNTIME=./runtime ./build/bin/nvim --luamod-dev"
alias nvdev="VIMRUNTIME=./runtime ./build/bin/nvim --luamod-dev"
#
# # android
alias shake="adb emu sensor set acceleration 100:100:100; sleep 1; adb emu sensor set acceleration 0:0:0"
#
# # flutter
alias db="fvm dart run build_runner build --delete-conflicting-outputs"
alias cdb="fvm flutter clean && fvm dart run build_runner build --delete-conflicting-outputs"
#
# # cli
# install_if_not_exists "lazygit"
alias lg="lazygit"

# install_if_not_exists "eza"
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias l='eza -bGF --header --git --color=always --group-directories-first --icons'

# install_if_not_exists "bat"
alias cat="bat"
alias grep="rg"
alias code_files="$HOME/code_to_file.sh/code_files.sh"

# VARIABLES
# config
bindkey -v
