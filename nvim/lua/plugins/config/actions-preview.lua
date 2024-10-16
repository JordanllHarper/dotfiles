local cmd = require 'utils'.custom_user_command

local opts = {}

cmd("ToggleActionsPreviewOn", function()
  require 'actions-preview'.setup(opts)
end, "Turn actions preview on")
