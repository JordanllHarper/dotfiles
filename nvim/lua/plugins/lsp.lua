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
}
