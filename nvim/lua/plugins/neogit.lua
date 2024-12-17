local leaderNmap = require("utils").leaderNmap
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function(_, opts)
		local ng = require("neogit")
		ng.setup(opts)
		leaderNmap("go", function()
			ng.open({ kind = "split" })
		end, "[g]it [o]pen")
	end,
}
