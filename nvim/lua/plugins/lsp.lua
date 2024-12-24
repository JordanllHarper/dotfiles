return {
  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim',   opts = {} },
    },
    config = function()
      require 'plugins.config.lsp'
    end,
  },
  {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "tex" },
    dependencies = { "neovim/nvim-lspconfig" },
    -- yes, you can use the opts field, just I'm showing the setup explicitly
    opts = {
      server_opts = {
        capabilities = require('blink-cmp').get_lsp_capabilities(),
        on_attach = function(client, bufnr)
          require("lsp-attach")(client, bufnr)
        end,
        settings = {
          ltex = {
            language = "en-GB"
          }
        }
      },
    }
  }
}
