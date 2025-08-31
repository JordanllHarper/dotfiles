local leaderNmap = require("utils").leader_nmap
return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "lsp" },
				rust = { "rustfmt" },
				go = { "goimports" },
				dart = { "dart_format" },
				json = { "deno_fmt" },
				javascript = { "deno_fmt" },
				typescript = { "deno_fmt" },
				javascriptreact = { "deno_fmt" },
				typescriptreact = { "deno_fmt" },
				svelte = { "lsp" },
				cc = { "clang-format" },
				ocaml = { "ocamlformat" },
				cpp = { "clang-format" },
				["_"] = { "trim_whitespace" },
			},
			default_format_opts = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			format_on_save = function()
				if require('custom.commands').formattingEnabled then
					return {
						lsp_format = "fallback",
						timeout_ms = 500,
					}
				else
					return nil
				end
			end,

		},
		config = function(_, opts)
			local conform = require('conform')
			conform.setup(opts)
			leaderNmap("f", function()
				if require('custom.commands').formattingEnabled then
					conform.format()
				end
			end, "[f]ormat")
		end,
	},
	{
		"ckipp01/stylua-nvim",
		ft = "lua"
	},
}
