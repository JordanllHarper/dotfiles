local utils = require 'utils'
local leaderNmap = utils.leaderNmap

leaderNmap("Rt", "<Cmd>RustLsp testables<CR>", "[R]ust [t]est")
leaderNmap("Ra", "<Cmd>RustAnalyzer restart<CR>", "[R]ust [a]nalyzer restart")

vim.g.rustaceanvim = {
  server = {
    on_attach = require('lsp-attach'),
    default_settings = {
      ['rust-analyzer'] = {
        diagnostics = {
          styleLints = true
        },
        inlayHints = {
          closureCaptureHints = true,
          closureReturnTypeHints = true,
          implicitDrops = true,
        }
      }
    }
  },
}
