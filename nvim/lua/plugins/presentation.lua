return {
	{
		'folke/todo-comments.nvim',
		opts = {}
	},
	{
		'rcarriga/nvim-notify',
		enabled = false,
		dependencies = {
			'nvim-telescope/telescope.nvim',
		},
		config = function()
			require 'plugins.config.notify'
		end
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		opts = {
			latex = {
				enabled = false
			}
		},
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		}
	},
	{
		"aznhe21/actions-preview.nvim",
		opts = {
			telescope = require 'telescope.themes'.get_cursor
				{ previewer = false },
		},
	},
	{
		"stevearc/dressing.nvim",
		enabled = false,
		opts = {
			input = {
				enabled = false,
			},
		},
	},
	{
		'goolord/alpha-nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('alpha').setup(require 'alpha.themes.startify'.config)
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',

		opts         = {
			options = {
				icons_enabled = true,
				theme = 'kanagawa',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
			extensions = { 'fugitive' },
			sections = {
				lualine_a = {
					{
						'mode',
						fmt = function(displayed_mode)
							return displayed_mode:sub(1, 1)
						end,
					},
				},
				lualine_b = {
					{
						'filename',
						path = 1,
						symbols = {
							modified = "[#]",
						},
					},
					{ 'diff' },
				},
				lualine_c = {},
				lualine_x = {
					{ 'diagnostics' },
				},
				lualine_y = {
					{ 'branch', },
					{ 'searchcount', },
				},
				lualine_z = { { 'location', },
					{ 'progress' },
					{ 'datetime', style = "%H:%M" },
				},
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			spec = {
				{ "<leader>c",  group = "[c]ode" },
				{ "<leader>D",  group = "[D]ebug" },
				{ "<leader>Ds", group = "[s]tep..." },
				{ "<leader>g",  group = "[g]it" },
				{ "<leader>l",  group = "[l]azy" },
				{ "<leader>L",  group = "[L]sp" },
				{ "<leader>n",  group = "[N]eotest" },
				{ "<leader>O",  group = "[O]il" },
				{ "<leader>q",  group = "[q]uickfix" },
				{ "<leader>r",  group = "[r]ename" },
				{ "<leader>R",  group = "[R]ust" },
				{ "<leader>s",  group = "[s]earch" },
				{ "<leader>w",  group = "[w]orkspace" },
			},
		},
	},
	{
		'nvim-tree/nvim-web-devicons',
		config = function()
			require 'plugins.config.nvim-tree-devicons'
		end
	}
}
