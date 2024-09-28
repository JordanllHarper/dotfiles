return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', },
    { 'williamboman/mason-lspconfig.nvim', },
    { 'hrsh7th/cmp-nvim-lsp' },

    { 'williamboman/mason-lspconfig.nvim', },
    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim',                 opts = {} },
  },
  config = function()
    require 'plugins.config.lsp'
  end
}
