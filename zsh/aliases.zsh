alias nvimcfg='nvim ~/.config/nvim/'
alias cfg="nvim ~/.config/"
alias ndir='nvim ~/notes/'
alias shake="adb emu sensor set acceleration 100:100:100; sleep 1; adb emu sensor set acceleration 0:0:0"

alias db="fvm dart run build_runner build --delete-conflicting-outputs"
# clean dart build 
alias cdb="fvm flutter clean && fvm dart run build_runner build --delete-conflicting-outputs"

# cli
alias lg="lazygit"
alias ls="eza"
alias cat="bat"
alias grep="rg"
