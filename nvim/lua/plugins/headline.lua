return {
  'lukas-reineke/headlines.nvim',
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require 'plugins.config.headlines'
  end
}
