local nmap = require('utils').nmap
local opts = {
  -- Disable so we can move
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
  }
}
require('oil').setup(opts)
nmap("-", "<Cmd>Oil<CR>", "[-] Oil")
