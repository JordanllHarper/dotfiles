local M = {}

---Alias for vim.keymap.set. Sets defaults: silent and noremap
---@param mode string | table
---@param lhs string
---@param rhs function | string 
---@param desc string?
function M.map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, noremap = true })
end

---Calls M.map but specifies the mode to be normal.
---@param lhs string
---@param rhs function | string
---@param desc string
function M.nmap(lhs, rhs, desc)
	M.map('n', lhs, rhs, desc)
end

---Calls M.map but specifies the mode to be insert.
---@param lhs string
---@param rhs function | string
---@param desc string
function M.imap(lhs, rhs, desc)
	M.map('i', lhs, rhs, desc)
end

---Calls M.map and specifies using the '<leader>' prefix for the keymap.
---@param mode string | table
---@param lhs string
---@param rhs function | string
---@param desc string
function M.leaderMap(mode, lhs, rhs, desc)
	M.map(mode, '<leader>' .. lhs, rhs, desc)
end

---Calls M.map, specifies using the '<leader>' prefix for the keymap and uses normal mode. 
---@param lhs string
---@param rhs function | string
---@param desc string
function M.leaderNmap(lhs, rhs, desc)
	M.nmap('<leader>' .. lhs, rhs, desc)
end

---Creates a user command for the given buffer.
---@param bufnr number
---@param name string
---@param command string | function
---@param desc string
function M.custom_buf_user_command(bufnr, name, command, desc)
	vim.api.nvim_buf_create_user_command(bufnr, name, command, { desc = desc })
end

---Creates a global user command.
---@param name string
---@param command string | function
---@param desc string
function M.custom_user_command(name, command, desc)
	vim.api.nvim_create_user_command(name, command, { desc = desc })
end

return M
