local leaderNmap = require("utils").leader_nmap

local opts = {
	settings = {
		renameFilesWithClasses = "always",
	},
	fvm = true,
	lsp = {
		on_attach = function(_, bufnr)
			require("lsp-attach")(_, bufnr)
			local ftCmd = require("flutter-tools.commands")
			leaderNmap("Frl", ftCmd.reload, "[F]lutter [r]e[l]oad")
			leaderNmap("Frs", ftCmd.restart, "[F]lutter [r]e[s]tart")
			leaderNmap("Fs", ftCmd.run, "[F]lutter [s]tart (run)")
			leaderNmap("Fq", ftCmd.quit, "[F]lutter [q]uit")
			leaderNmap("Fe", "<Cmd>FlutterEmulators<CR>", "[F]lutter [e]mulators")
			leaderNmap("Fc", require("flutter-tools.log").clear, "[F]lutter [c]lear")
			leaderNmap("Fl", require("flutter-tools.log").toggle, "[F]lutter [l]og (toggle)")
			leaderNmap("FL", require("flutter-tools.lsp").restart, "[F]lutter [L]sp Restart")
		end,
		color = {
			enabled = true,
		},
	},
	widget_guides = {
		enabled = true,
	},
}

require("flutter-tools").setup(opts)
require("telescope").load_extension("flutter")
