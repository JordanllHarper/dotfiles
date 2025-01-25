local cmd = require("utils").custom_buf_user_command
local ts = require("telescope.builtin")

local set = vim.keymap.set
local del = vim.keymap.del

---Configures the lsp keymaps
---@param bufnr number
local function configure_lsp(bufnr)
	local buf_nmap = function(keys, func, desc)
		set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local buf_leader_nmap = function(keys, func, desc)
		set("n", "<leader>" .. keys, func, { buffer = bufnr, desc = desc })
	end

	local lspbuf = vim.lsp.buf

	buf_leader_nmap("h", lspbuf.hover, "[h]over")
	buf_leader_nmap("k", lspbuf.signature_help, "Signature [H]elp")
	set({ "i", "s", "v" }, "<C-k>", lspbuf.signature_help, { desc = "Signature Help", buffer = bufnr })
	buf_leader_nmap("rn", lspbuf.rename, "[r]e[n]ame")
	-- Treesitter
	buf_nmap("gd", ts.lsp_definitions, "[g]oto [d]efinition")
	buf_nmap("gr", function()
		ts.lsp_references({ include_declaration = false, include_current_line = false })
	end, "[g]oto [r]eferences")
	buf_nmap("gI", ts.lsp_implementations, "[g]oto [i]mplementation")
	buf_leader_nmap("t", ts.lsp_type_definitions, "[t]ype Definition")
	buf_leader_nmap("Q", vim.lsp.codelens.run, "[Q]ode lense")
	-- Document
	buf_leader_nmap("d", ts.lsp_document_symbols, "[d]ocument Symbols")
	-- Wocument lmao
	-- Workspace
	buf_leader_nmap("w", ts.lsp_workspace_symbols, "[w]ocument Symbols")
	buf_leader_nmap("ss", ts.lsp_dynamic_workspace_symbols, "[s]earch [s]ymbols")

	-- Code actions
	buf_leader_nmap("c", require('actions-preview').code_actions, "[c]ode action")

	-- Hints
	buf_leader_nmap("Lt", "<Cmd>ToggleHints<CR>", "[T]oggle hints")
	cmd(bufnr, "ToggleHints", function(_)
		require("lsp-attach.toggle_virt_text").toggle()
	end, "Toggle Virtual Text in Buffer")
end

---Configures the default keymaps for diagnostics
---@param bufnr number
local function configure_diagnostic(bufnr)
	local buf_nmap = function(keys, func, desc)
		set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local buf_leader_nmap = function(keys, func, desc)
		set("n", "<leader>" .. keys, func, { buffer = bufnr, desc = desc })
	end

	local diagnostic = vim.diagnostic

	local function diagnostic_jump(count)
		diagnostic.jump {
			count = count,
			severity = { min = vim.diagnostic.severity.WARN }
		}
	end

	buf_nmap("[d", function()
		diagnostic_jump(-1)
	end, "Go to previous diagnostic message")

	buf_nmap("]d", function()
		diagnostic_jump(1)
	end, "Go to next diagnostic message")

	buf_leader_nmap("e", diagnostic.open_float, "Open [E]rror float")

	-- Treesitter
	buf_leader_nmap("sd", function()
		ts.diagnostics({ bufnr = 0 })
	end, "[S]earch [D]iagnostics (current buffer)")
	buf_leader_nmap("sD", ts.diagnostics, "[S]earch [D]iagnostics")
end

---Deletes the default keybindings
local function delete_defaults()
	local bufdel = function(mode, lhs)
		pcall(function()
			del(mode, lhs)
		end)
	end
	bufdel("n", "grn")
	bufdel("n", "gra")
	bufdel("n", "grr")
	bufdel("n", "gri")
	bufdel("i", "<C-S>")
end

return function(_, bufnr)
	delete_defaults()
	configure_lsp(bufnr)
	configure_diagnostic(bufnr)
end
