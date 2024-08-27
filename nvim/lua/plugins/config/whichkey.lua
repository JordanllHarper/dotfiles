local wk = require("which-key")
local registers = {
  { '<leader>b',  group = '[B]uffer', },
  { '<leader>c',  group = '[C]ode', },
  { '<leader>d',  group = '[D]isplay', },
  { '<leader>nf', group = '[F]...', },
  { '<leader>f',  group = '[F]lutter', },
  { '<leader>g',  group = '[G]it', },
  { '<leader>l',  group = '[L]azy', },
  { '<leader>L',  group = '[L]sp', },
  { '<leader>o',  group = '[O]verseer', },
  { '<leader>O',  group = '[O]il', },
  { '<leader>fr', group = '[R]e...', },
  { '<leader>q',  group = '[Q]uickfix', },
  { '<leader>r',  group = '[R]ename', },
  { '<leader>s',  group = '[S]earch', },
  { '<leader>t',  group = '[T]erminal', },
  { '<leader>w',  group = '[W]orkspace', },
}
wk.add(registers)
