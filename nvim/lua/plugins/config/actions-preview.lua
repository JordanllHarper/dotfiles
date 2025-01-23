local cmd = require 'utils'.custom_user_command

local opts = {
  telescope = {
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      width = 0.8,
      height = 0.9,
      prompt_position = "bottom",
      preview_cutoff = 20,
      preview_height = function(_, _, max_lines)
        return max_lines - 15
      end,
    },
  },
}

require('actions-preview').setup(opts)

cmd("ToggleActionsPreviewOn", function()
  require 'actions-preview'.setup(opts)
end, "Turn actions preview on")
