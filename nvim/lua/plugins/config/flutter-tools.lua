local leaderNmap = require 'utils'.leaderNmap
local flutter_key_bindings = function()
  local ftCmd = require 'flutter-tools.commands'
  leaderNmap('frl', ftCmd.reload, '[F]lutter [R]e[L]oad')
  leaderNmap('frs', ftCmd.restart, '[F]lutter [R]e[S]tart')
  leaderNmap('fs', ftCmd.run, '[F]lutter [S]tart (Run)')
  leaderNmap('fq', ftCmd.quit, '[F]lutter [Q]uit')
  leaderNmap('fe', "<Cmd>FlutterEmulators<CR>", '[F]lutter [E]mulators')
  leaderNmap('fo', require('flutter-tools.outline').toggle, '[F]lutter [O]utline')
  leaderNmap('fc', require('flutter-tools.log').clear, '[F]lutter [C]lear')
  leaderNmap('fL', require('flutter-tools.lsp').restart, '[F]lutter [L]sp Restart')
end

local opts = {
  settings = {
    renameFilesWithClasses = "always",
  },
  fvm = true,
  lsp = {
    on_attach = function(_, bufnr)
      require('keymaps.lsp-attach')(_, bufnr)
      flutter_key_bindings()
    end,
    color = {
      enabled = true,
    },
  },
  widget_guides = {
    enabled = true,
  },
}

require('flutter-tools').setup(opts)
require('telescope').load_extension("flutter")
