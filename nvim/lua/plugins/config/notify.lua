local opts = {
  fps = 60,
  timeout = 6000,
  render = "compact"
}
require 'notify'.setup(opts)

local leaderNmap = require 'utils'.leaderNmap
leaderNmap('sn', require('telescope').extensions.notify.notify,
  '[s]earch [n]otifications')
vim.notify = require("notify")
