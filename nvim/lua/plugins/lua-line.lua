return {
  'nvim-lualine/lualine.nvim',

  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config       = function()
    require 'plugins.config.lua-line'
  end
}
