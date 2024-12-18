return {
	"akinsho/flutter-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"stevearc/dressing.nvim",
			enabled = false,
			opts = {
				input = {
					enabled = false,
				},
			},
		},
	},
	config = function()
		require("plugins.config.flutter-tools")
	end,
}
