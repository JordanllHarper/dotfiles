alias nv = nvim
alias lg = lazygit

def nvimcfg [] { 
    let path = $env.XDG_CONFIG_HOME | path join "nvim"
    z $path
    nvim
}

