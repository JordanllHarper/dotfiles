return {
  'rcarriga/nvim-notify',

  dependencies = {
    'nvim-telescope/telescope.nvim',
  },

  config = function()
    require 'plugins.config.notify'
  end
}
