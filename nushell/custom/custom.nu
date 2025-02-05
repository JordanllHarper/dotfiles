alias nv = nvim
alias lg = lazygit

def nvimcfg [] { 
    let path = $env.XDG_CONFIG_HOME | path join "nvim"
    z $path
    nvim
}

def dirs [] { ls | where type == dir }

alias db = fvm dart run build_runner build
alias dw = fvm dart run build_runner watch
alias ft = fvm flutter test
