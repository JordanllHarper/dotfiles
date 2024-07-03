local map = require 'utils'.map
local imap = require 'utils'.imap
local cmd = require 'utils'.custom_user_command
return function(_, bufnr)
	-- TODO: Find a way to make more general
	local bufnmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	local bufimap = function(keys, func, desc)
		vim.keymap.set('i', keys, func, { buffer = bufnr, desc = desc })
	end

	local bufleaderNmap = function(keys, func, desc)
		vim.keymap.set('n', '<leader>' .. keys, func, { buffer = bufnr, desc = desc })
	end

	bufleaderNmap('h', vim.lsp.buf.hover, '[H]over')
	bufleaderNmap('rn', vim.lsp.buf.rename, '[R]e[N]ame')
	bufimap('<C-i>', vim.lsp.buf.signature_help, 'Signature [H]elp')

	bufnmap('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
	bufnmap(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')

	bufnmap(']q', "<Cmd>cnext<CR>", 'Next quickfix')
	bufnmap('[q', "<Cmd>cprev<CR>", 'Previous quickfix')

	bufleaderNmap('e', vim.diagnostic.open_float, 'Open [E]rror float')

	bufleaderNmap("<CR>", require("actions-preview").code_actions)

	imap("<C-n>", "<C-x><C-o>")

	cmd(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, 'Format current buffer with LSP')


	-- telescope lsp keymaps

	local ts = require('telescope.builtin')
	bufnmap('gd', ts.lsp_definitions, '[G]oto [D]efinition')
	bufnmap('gr', ts.lsp_references, '[G]oto [R]eferences')
	bufnmap('gI', ts.lsp_implementations, '[G]oto [I]mplementation')

	bufleaderNmap('T', ts.lsp_type_definitions, '[T]ype Definition')
	bufleaderNmap('ds', ts.lsp_document_symbols, '[D]ocument [S]ymbols')
	bufleaderNmap('ss', ts.lsp_dynamic_workspace_symbols, '[S]earch [S]ymbols')

	bufleaderNmap('sd', function() require('telescope.builtin').diagnostics { bufnr = 0 } end,
		'[S]earch [D]iagnostics (current buffer)')

	bufleaderNmap('sD', require('telescope.builtin').diagnostics, '[S]earch [D]iagnostics')
end
