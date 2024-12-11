local cmd = require("utils").custom_buf_user_command
local ts = require("telescope.builtin")

local set = vim.keymap.set
local del = vim.keymap.del

-- utils

---Configures the lsp keymaps
---@param bufnr number
local function configure_lsp(bufnr)
	local bufnmap = function(keys, func, desc)
		set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local bufleaderNmap = function(keys, func, desc)
		set("n", "<leader>" .. keys, func, { buffer = bufnr, desc = desc })
	end

	local lspbuf = vim.lsp.buf

	bufleaderNmap("h", lspbuf.hover, "[h]over")
	bufleaderNmap("k", lspbuf.signature_help, "Signature [H]elp")
	set({ "i", "s", "v" }, "<C-k>", lspbuf.signature_help, { desc = "Signature Help", buffer = bufnr })
	bufleaderNmap("rn", lspbuf.rename, "[r]e[n]ame")
	-- Treesitter
	bufnmap("gd", ts.lsp_definitions, "[g]oto [d]efinition")
	bufnmap("gr", ts.lsp_references, "[g]oto [r]eferences")
	bufnmap("gI", ts.lsp_implementations, "[g]oto [i]mplementation")
	bufleaderNmap("T", ts.lsp_type_definitions, "[T]ype Definition")
	-- Document
	bufleaderNmap("d", ts.lsp_document_symbols, "[d]ocument Symbols")
	-- Wocument lmao
	-- Workspace
	bufleaderNmap("w", ts.lsp_workspace_symbols, "[w]ocument Symbols")
	bufleaderNmap("ss", ts.lsp_dynamic_workspace_symbols, "[s]earch [s]ymbols")

	-- Code actions
	bufleaderNmap("c", require("actions-preview").code_actions)

	-- Hints
	bufleaderNmap("Lt", "<Cmd>ToggleHints<CR>", "[T]oggle hints")
	cmd(bufnr, "ToggleHints", function(_)
		require("lsp-attach.toggle_virt_text").toggle()
	end, "Toggle Virtual Text in Buffer")

	-- Autoformat
	bufleaderNmap("f", function()
		lspbuf.format()
		print("Formatted")
	end, "[F]ormat")
end

---Configures the default keymaps for diagnostics
---@param bufnr number
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
	end, "Go to previous diagnostic message")

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

---Deletes the default keybindings
---@param bufnr number
local function delete_defaults(bufnr)
	local bufdel = function(mode, lhs)
		pcall(function()
			del(mode, lhs, { buffer = bufnr })
		end)
	end
	bufdel("n", "grn")
	bufdel("n", "gra")
	bufdel("n", "grr")
	bufdel("n", "gri")
	bufdel("i", "<C-S>")
end

return function(_, bufnr)
	delete_defaults(bufnr)
	configure_lsp(bufnr)
	configure_diagnostic(bufnr)
end
