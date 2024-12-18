return {

  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    -- Lazygit
    require 'utils'.leader_nmap('lg', require('lazygit').lazygit, '[L]azy[G]it')
  end
}
