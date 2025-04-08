local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
local capabilities = function() return require("blink-cmp").get_lsp_capabilities() end

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

vim.api.nvim_create_autocmd({ "BufEnter", "FileWritePost" },
	{
		callback = function(_)
			vim.lsp.codelens.refresh({ bufnr = 0 })
		end
	}
)
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*.md",
	callback = function()
		vim.opt.spell = true
	end
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = "*.md",
	callback = function()
		vim.opt.spell = false
	end
})
