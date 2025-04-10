local leader_nmap_cmd = require("utils").leader_nmap_cmd
local nmap = require("utils").nmap
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
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {},
		config = function(_, opts)
			require("toggleterm").setup(opts)
			leader_nmap_cmd("tt", "ToggleTerm direction=horizontal", "[t]oggle [t]erminals")
			leader_nmap_cmd("ta", "ToggleTermToggleAll", "[t]oggle [a]ll terminals")
		end
	}
}
