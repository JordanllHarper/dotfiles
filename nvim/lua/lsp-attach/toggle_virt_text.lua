local M = {}

local vt = vim.diagnostic.config().virtual_text
M.toggle = function()
	vt = not vt
	vim.diagnostic.config { virtual_text = vt }
end

return M
