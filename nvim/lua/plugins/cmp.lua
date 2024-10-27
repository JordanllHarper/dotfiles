return {
  lazy = true,
  {
    'hrsh7th/cmp-cmdline',
  },
  {
    'hrsh7th/cmp-buffer',
  },
  {
    'hrsh7th/cmp-path',
  },
  {
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
      { 'onsails/lspkind.nvim', config = function() require('lspkind').init() end }
    },

    'hrsh7th/nvim-cmp',
    -- !! Configuration !!
    config = function()
      require 'plugins.config.cmp'
    end,
  }
}
