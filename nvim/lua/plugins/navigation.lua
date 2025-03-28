return {
	{
		'stevearc/oil.nvim',
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
		config = function(_, opts)
			require('oil').setup(opts)
			vim.keymap.set(
				"n",
				"-",
				"<CMD>Oil<CR>",
				{ desc = "Open parent directory" }
			)
		end
	},
	{
		{
			'nvim-telescope/telescope.nvim',
			branch = '0.1.x',
			dependencies = {
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope-fzf-native.nvim',
				"debugloop/telescope-undo.nvim",
			},
			config = function()
				require 'plugins.config.telescope'
			end,
		},
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
	}
}
