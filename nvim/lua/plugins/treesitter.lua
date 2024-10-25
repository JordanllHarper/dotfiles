return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    {
      'nvim-treesitter/nvim-treesitter-context',
      opts = {},

    },
  },
  build = ':TSUpdate',
  config = function()
    require 'plugins.config.treesitter'
  end
}
