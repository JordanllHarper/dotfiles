local leaderNmap = require("utils").leader_nmap
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			-- lua = { "stylua" },
			rust = { "rustfmt", lsp_format = "fallback" },
			go = { "gofmt" },
			dart = { "dart_format", lsp_format = "fallback" },
		},
		-- formatters= {
		-- 	tidy_markdown = {
		-- 		command = "tidy_markdown"
		-- 	}
		-- }
	},
	config = function(_, opts)
		require("conform").setup(opts)
		leaderNmap("f", require("conform").format, "[f]ormat")
	end,
}
