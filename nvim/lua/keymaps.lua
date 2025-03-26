local map = vim.keymap.set
local nmap = require("utils").nmap
local leader_nmap = require("utils").leader_nmap

-- Quickfix
leader_nmap("qo", "<Cmd>copen<CR>", "[Q]uickfix [O]pen")
leader_nmap("qc", "<Cmd>cclose<CR>", "[Q]uickfix [C]lose")
nmap("]q", "<Cmd>cnext<CR>", "Next [Q]uickfix")
nmap("[q", "<Cmd>cprev<CR>", "Previous [Q]uickfix")

-- Terminal

vim.api.nvim_create_user_command(
	"SplitTerm",
	function()
		vim.cmd("hor split")
		vim.cmd("winc j")
		vim.cmd.term()
	end,
	{}
)

leader_nmap("T", function()
	vim.cmd("SplitTerm")
end, "[t]erminal")
--
map("t", "<C-q>", "<C-\\><C-n>", { silent = true, desc = "[Q]uit terminal mode" })

-- lua files
leader_nmap("S", function()
	vim.cmd("luafile %")
	vim.notify("Sourced current Lua file", vim.log.levels.INFO, {})
end, "[S]ource luafile")

-- Lsp
leader_nmap("Li", "<Cmd>LspInfo<CR>", "[L]sp [I]nfo")
leader_nmap("Lr", "<Cmd>LspRestart<CR>", "[L]sp [R]estart")

-- buffers
leader_nmap("]", function()
	vim.cmd("bnext")
end, "Next buffer")
leader_nmap("[", function()
	vim.cmd("bprevious")
end, "Previous buffer")

leader_nmap("b", function()
	vim.cmd("bdelete")
end, "Delete buffer")

leader_nmap("B", function()
	vim.cmd("bdelete!")
end, "Delete buffer (override)")


-- tabs
leader_nmap(">", function()
	vim.cmd("tnext")
end, "Next tab")
leader_nmap("<", function()
	vim.cmd("tprevious")
end, "Previous tab")

leader_nmap("x", function()
	vim.cmd("tabclose")
end, "Delete tab")

leader_nmap("X", function()
	vim.cmd("x!")
end, "Delete tab (override)")
