local leaderNmap = require("utils").leader_nmap
local leaderNmapCmd = require("utils").leader_nmap_cmd
return {
	{
		"tpope/vim-fugitive",
		config = function()
			leaderNmapCmd("gc", "Git commit", "[g]it [C]ommit")
			leaderNmapCmd("G", "Git", "[g]it [C]ommit")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function()
				local gs = require("gitsigns")
				leaderNmap("gh", gs.preview_hunk, "[g]it [h]unk")
				leaderNmap("gs", gs.stage_hunk, "[g]it [s]tage hunk")
				leaderNmap("gr", gs.reset_hunk, "[g]it [r]eset hunk")
				leaderNmap("gS", gs.stage_buffer, "[g]it [S]tage buffer")
			end,
		},
	},
}
