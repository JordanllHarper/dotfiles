local wk = require("which-key")
local registers = {
  { '<leader>c',  group = '[c]ode', },
  { '<leader>nf', group = '[f]...', },
  { '<leader>D',  group = '[D]ebug', },
  { '<leader>Ds', group = '[s]tep...', },
  { '<leader>g',  group = '[g]it', },
  { '<leader>l',  group = '[l]azy', },
  { '<leader>L',  group = '[L]sp', },
  { '<leader>n',  group = '[N]eotest' },
  { '<leader>O',  group = '[O]il', },
  { '<leader>fr', group = '[r]e...', },
  { '<leader>q',  group = '[q]uickfix', },
  { '<leader>r',  group = '[r]ename', },
  { '<leader>R',  group = '[R]ust', },
  { '<leader>s',  group = '[s]earch', },
  { '<leader>t',  group = '[t]erminal', },
  { '<leader>w',  group = '[w]orkspace', },
}
wk.add(registers)
