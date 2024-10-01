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

# PLUGINS
# zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


# TOOLS 
eval "$(zoxide init zsh)"
eval "$(opam config env)"
eval "$(oh-my-posh init zsh --config $ZSH_CONFIG/themes/tokyo.omp.json)"
eval "$(fzf --zsh)"


# oh my zsh setup
source "$ZSH_CONFIG/oh-my-zsh-config.zsh"

# ALIASES
alias nvimcfg='nvim ~/.config/nvim/'
alias cfg="nvim ~/.config/"
alias ndir='nvim ~/notes/'
alias nnew='nvim ~/notes/skel_note.md'

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
