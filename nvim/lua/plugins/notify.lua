return {
  'rcarriga/nvim-notify',
  enabled = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },

  config = function()
    require 'plugins.config.notify'
  end
}
