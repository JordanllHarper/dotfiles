local utils = require'utils'
local leaderNmap = utils.leaderNmap


leaderNmap("Rt", "<Cmd>RustTest!<CR>", "[R]ust [T]est")
leaderNmap("Ra", "<Cmd>RustAnalyzer restart<CR>", "[R]ust [A]nalyzer restart")


vim.g.rustaceanvim = {
  server = {
    on_attach = require('keymaps.lsp-attach')
  }
}
