local map = require 'utils'
local dapui = require 'dapui'
local opts = {}

dapui.setup(opts)

map.leaderNmap("Dv", dapui.toggle, "Toggle [V]iew")
