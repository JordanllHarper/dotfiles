return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
    },
    build = ':TSUpdate',
    config = function()
      require 'plugins.config.treesitter'
    end
  },
  {
    "nushell/tree-sitter-nu",
    dependencies = 'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate nu"
  },
}
