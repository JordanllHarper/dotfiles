local opts = {}
local registers = {
  ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]isplay', _ = 'which_key_ignore' },
  ['<leader>nf'] = { name = '[F]...', _ = 'which_key_ignore' },
  ['<leader>f'] = { name = '[F]lutter', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>l'] = { name = '[L]azy', _ = 'which_key_ignore' },
  ['<leader>L'] = { name = '[L]sp', _ = 'which_key_ignore' },
  ['<leader>o'] = { name = '[O]verseer', _ = 'which_key_ignore' },
  ['<leader>O'] = { name = '[O]il', _ = 'which_key_ignore' },
  ['<leader>fr'] = { name = '[R]e...', _ = 'which_key_ignore' },
  ['<leader>q'] = { name = '[Q]uickfix', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]erminal', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}
require 'which-key'.register(registers, opts)
