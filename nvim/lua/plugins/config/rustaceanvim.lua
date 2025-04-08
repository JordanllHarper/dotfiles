local utils = require 'utils'
local leaderNmap = utils.leader_nmap
local batchMap = utils.batchMap

local mappings = {
  { "Rt", "<Cmd>RustLsp testables<CR>",    "[R]ust [t]est" },
  { "Ra", "<Cmd>RustAnalyzer restart<CR>", "[R]ust [a]nalyzer restart" },
}

batchMap(mappings, leaderNmap)

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
          implicitDrops = true,
        },
        completion = {
          privateEditable = true,
        }
      }
    }
  },
}
