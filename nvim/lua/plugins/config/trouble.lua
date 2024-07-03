local leaderNmap = require 'utils'.leaderNmap
local opts = {
  action_keys = {
    hover = '<leader>h',
  }
}
require 'trouble'.setup(opts)

leaderNmap('wd', function()
    require('trouble').toggle("diagnostics")
  end,
  '[W]orkspace [D]iagnostics')

leaderNmap('ws', function()
    require('trouble').toggle("symbols")
  end,
  '[W]orkspace [S]ymbols')
