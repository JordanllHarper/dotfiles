local utils = require('utils')
local nmap = utils.nmap
local leader_nmap = utils.leader_nmap
return {
	"aaronik/treewalker.nvim",

	-- The following options are the defaults.
	-- Treewalker aims for sane defaults, so these are each individually optional,
	-- and the whole opts block is optional as well.
	opts = {
		-- Whether to briefly highlight the node after jumping to it
		highlight = true,

		-- How long should above highlight last (in ms)
		highlight_duration = 250,

		-- The color of the above highlight. Must be a valid vim highlight group.
		-- (see :h highlight-group for options)
		highlight_group = "ColorColumn",
	},
	config = function(_, opts)
		require('treewalker').setup(opts)
		vim.keymap.set('n', '<C-S-j>', '<Cmd>Treewalker SwapDown<CR>', { noremap = true, silent = true })
		vim.keymap.set('n', '<C-S-k>', '<Cmd>Treewalker SwapUp<CR>', { noremap = true, silent = true })
	end
}
