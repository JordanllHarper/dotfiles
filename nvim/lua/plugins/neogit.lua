local leaderNmap = require("utils").leaderNmap
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		kind = "split",
		disable_line_numbers = false,
		disable_relative_line_numbers = false,
		commit_editor = {
			kind = "vsplit"
		},
	},
	config = function(_, opts)
		local ng = require("neogit")
		ng.setup(opts)
		leaderNmap("go", function()
			ng.open()
		end, "[g]it [o]pen")
	end,
}
