return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
      "sidlatau/neotest-dart",
    },
    config = function()
      require 'plugins.config.neotest'
    end
  },
}
