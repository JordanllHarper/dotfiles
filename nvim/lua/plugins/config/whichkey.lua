local wk = require("which-key")
local registers = {
  { '<leader>b',  group = '[B]uffer', },
  { '<leader>c',  group = '[C]ode', },
  { '<leader>nf', group = '[F]...', },
  { '<leader>D',  group = '[D]ebug', },
  { '<leader>Ds', group = '[S]tep...', },
  { '<leader>f',  group = '[F]lutter', },
  { '<leader>g',  group = '[G]it', },
  { '<leader>l',  group = '[L]azy', },
  { '<leader>L',  group = '[L]sp', },
  { '<leader>n',  group = '[N]eotest' },
  { '<leader>o',  group = '[O]verseer', },
  { '<leader>O',  group = '[O]il', },
  { '<leader>fr', group = '[R]e...', },
  { '<leader>q',  group = '[Q]uickfix', },
  { '<leader>r',  group = '[R]ename', },
  { '<leader>R',  group = '[R]ust', },
  { '<leader>s',  group = '[S]earch', },
  { '<leader>t',  group = '[T]erminal', },
  { '<leader>w',  group = '[W]orkspace', },
}
wk.add(registers)
