local leaderNmap = require("utils").leaderNmap
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			markdown = { "markdownfmt" },
			rust = { "rustfmt", lsp_format = "fallback" },
			go = { "gofmt" },
			dart = { "dart_format", lsp_format = "fallback" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
		leaderNmap("f", require("conform").format, "[f]ormat")
	end,
}
