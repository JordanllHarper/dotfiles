local M = {}

function M.map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, noremap = true })
end

function M.nmap(lhs, rhs, desc)
	M.map('n', lhs, rhs, desc)
end

function M.imap(lhs, rhs, desc)
	M.map('i', lhs, rhs, desc)
end

function M.leaderMap(mode, lhs, rhs, desc)
	M.map(mode, '<leader>' .. lhs, rhs, desc)
end

function M.leaderNmap(lhs, rhs, desc)
	M.nmap('<leader>' .. lhs, rhs, desc)
end

function M.custom_user_command(bufnr, name, command, desc)
	vim.api.nvim_buf_create_user_command(bufnr, name, command, { desc = desc })
end

return M
