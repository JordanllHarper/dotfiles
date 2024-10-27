local cmd = require("utils").custom_buf_user_command
local ts = require("telescope.builtin")

local set = vim.keymap.set

-- utils

local function configure_lsp(bufnr)
	local bufnmap = function(keys, func, desc)
		set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local bufleaderNmap = function(keys, func, desc)
		set("n", "<leader>" .. keys, func, { buffer = bufnr, desc = desc })
	end
	local lspbuf = vim.lsp.buf

	bufleaderNmap("h", lspbuf.hover, "[H]over")
	bufleaderNmap("H", lspbuf.signature_help, "Signature [H]elp")
	bufleaderNmap("rn", lspbuf.rename, "[R]e[N]ame")

	-- Treesitter
	bufnmap("gd", ts.lsp_definitions, "[G]oto [D]efinition")
	bufnmap("gr", ts.lsp_references, "[G]oto [R]eferences")
	bufnmap("gI", ts.lsp_implementations, "[G]oto [I]mplementation")
	bufleaderNmap("T", ts.lsp_type_definitions, "[T]ype Definition")
	-- Document
	bufleaderNmap("d", ts.lsp_document_symbols, "[D]ocument Symbols")
	-- Wocument lmao
	-- Workspace
	bufleaderNmap("w", ts.lsp_workspace_symbols, "[W]ocument Symbols")
	bufleaderNmap("ss", ts.lsp_dynamic_workspace_symbols, "[S]earch [S]ymbols")

	-- Code actions
	bufleaderNmap("c", require("actions-preview").code_actions)

	-- Hints
	bufleaderNmap("Lt", "<Cmd>ToggleHints<CR>", "[T]oggle hints")
	cmd(bufnr, "ToggleHints", function(_)
		require 'lsp-attach.toggle_virt_text'.toggle()
	end, "Toggle Virtual Text in Buffer")

	-- Autoformat
	bufleaderNmap("f", function()
		lspbuf.format()
		vim.notify("Formatted", vim.log.levels.INFO)
	end, "[F]ormat")
end

local function configure_diagnostic(bufnr)
	local bufnmap = function(keys, func, desc)
		set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local bufleaderNmap = function(keys, func, desc)
		set("n", "<leader>" .. keys, func, { buffer = bufnr, desc = desc })
	end


	local diagnostic = vim.diagnostic

	local severity = diagnostic.severity
	local severityOpts = { severity = { severity.WARN, severity.ERROR } }

	bufnmap("[d", function()
			diagnostic.goto_prev(severityOpts)
		end,
		"Go to previous diagnostic message")

	bufnmap("]d", function()
		diagnostic.goto_next(severityOpts)
	end, "Go to next diagnostic message")

	bufleaderNmap("e", diagnostic.open_float, "Open [E]rror float")


	-- Treesitter
	bufleaderNmap("sd", function()
		ts.diagnostics({ bufnr = 0 })
	end, "[S]earch [D]iagnostics (current buffer)")
	bufleaderNmap("sD", ts.diagnostics, "[S]earch [D]iagnostics")
end

return function(_, bufnr)
	configure_lsp(bufnr)
	configure_diagnostic(bufnr)

	cmd(bufnr, "Format", function(_)
		require 'stylua-nvim'.format_file()
	end, "Format current buffer with LSP")

	cmd(bufnr, "ToggleHints", function(_)
		require 'lsp-attach.toggle_virt_text'.toggle()
	end, "Toggle Virtual Text in Buffer")
end
