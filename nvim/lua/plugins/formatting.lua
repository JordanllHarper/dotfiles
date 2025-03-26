local leaderNmap = require("utils").leader_nmap
return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "fallback" },
				rust = { "rustfmt" },
				go = { "gofmt" },
				dart = { "dart_format" },
				json = { "deno_fmt" },
				cc = { "clang-format" },
				cpp = { "clang-format" },
				["_"] = { "trim_whitespace" },
			},
			default_format_opts = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)
			leaderNmap("f", require("conform").format, "[f]ormat")
		end,
	},
	{
		"ckipp01/stylua-nvim",
		ft = "lua"
	},
}
