return {
	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require "plugins.config.flutter-tools"
		end,
	},

	{
		{
			'mrcjkb/rustaceanvim',
			config = function()
				require 'plugins.config.rustaceanvim'
			end,
			lazy = false
		},
		{
			'saecki/crates.nvim',
			event = { "BufRead Cargo.toml" },
			opts = {},
		}
	},

	{ 'nanotee/zoxide.vim' },

	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown", -- or 'event = "VeryLazy"'
		opts = {}
	}
}
