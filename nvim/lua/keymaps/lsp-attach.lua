local imap = require("utils").imap
local cmd = require("utils").custom_buf_user_command

return function(_, bufnr)
	-- TODO: Find a way to make more general
	local bufnmap = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local bufleaderNmap = function(keys, func, desc)
		vim.keymap.set("n", "<leader>" .. keys, func, { buffer = bufnr, desc = desc })
	end

	bufleaderNmap("h", vim.lsp.buf.hover, "[H]over")
	bufleaderNmap("H", vim.lsp.buf.signature_help, "Signature [H]elp")
	bufleaderNmap("rn", vim.lsp.buf.rename, "[R]e[N]ame")



	local function jump_to_prev_diagnostic()
		vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_prev() })
	end

	local function jump_to_next_diagnostic()
		vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_next() })
	end

	bufnmap("[d", jump_to_prev_diagnostic ,"Go to previous diagnostic message")
	bufnmap("]d", jump_to_next_diagnostic, "Go to next diagnostic message")

	bufnmap("]q", "<Cmd>cnext<CR>", "Next quickfix")
	bufnmap("[q", "<Cmd>cprev<CR>", "Previous quickfix")

	bufleaderNmap("e", vim.diagnostic.open_float, "Open [E]rror float")

	bufleaderNmap("c", require("actions-preview").code_actions)

	-- Escape terminal
	imap("<C-n>", "<C-x><C-o>")

	cmd(bufnr, "Format", function(_)
		require 'stylua-nvim'.format_file()
	end, "Format current buffer with LSP")

	cmd(bufnr, "ToggleHints", function(_)
		require 'lsp-attach.toggle_virt_text'.toggle()
	end, "Toggle Virtual Text in Buffer")

	bufleaderNmap("Lt", "<Cmd>ToggleHints<CR>", "[T]oggle hints")

	-- Autoformat
	bufleaderNmap("f", function()
		vim.lsp.buf.format()
		vim.notify("Formatted", vim.log.levels.INFO)
	end, "[F]ormat")

	-- telescope lsp keymaps

	local ts = require("telescope.builtin")
	bufnmap("gd", ts.lsp_definitions, "[G]oto [D]efinition")
	bufnmap("gr", ts.lsp_references, "[G]oto [R]eferences")
	bufnmap("gI", ts.lsp_implementations, "[G]oto [I]mplementation")

	bufleaderNmap("T", ts.lsp_type_definitions, "[T]ype Definition")
	bufleaderNmap("ds", ts.lsp_document_symbols, "[D]ocument [S]ymbols")
	bufleaderNmap("ss", ts.lsp_dynamic_workspace_symbols, "[S]earch [S]ymbols")

	bufleaderNmap("sd", function()
		require("telescope.builtin").diagnostics({ bufnr = 0 })
	end, "[S]earch [D]iagnostics (current buffer)")

	bufleaderNmap("sD", require("telescope.builtin").diagnostics, "[S]earch [D]iagnostics")
end
