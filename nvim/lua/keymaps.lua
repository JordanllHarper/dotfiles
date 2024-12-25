local map = vim.keymap.set
local nmap = require("utils").nmap
local leader_nmap = require("utils").leader_nmap

-- Quickfix
leader_nmap("qo", "<Cmd>copen<CR>", "[Q]uickfix [O]pen")
nmap("]q", "<Cmd>cnext<CR>", "Next [Q]uickfix")
nmap("[q", "<Cmd>cprev<CR>", "Previous [Q]uickfix")

-- Terminal
leader_nmap("t", function()
	vim.cmd("hor split")
	vim.cmd("winc j")
	vim.cmd.term()
end, "[T]erminal")
--
map("t", "<C-q>", "<C-\\><C-n>", { silent = true, desc = "[Q]uit terminal mode" })

-- lua files
leader_nmap("S", function()
	vim.cmd("luafile %")
	vim.notify("Sourced current Lua file", vim.log.levels.INFO, {})
end, "[S]ource luafile")

map("v", "S", function()
	print("Sourcing current lua selection...")
	vim.cmd("'<,'>source")
end)

-- Lsp
leader_nmap("Li", "<Cmd>LspInfo<CR>", "[L]sp [I]nfo")
leader_nmap("Lr", "<Cmd>LspRestart<CR>", "[L]sp [R]estart")

-- tabs
leader_nmap("]", function()
	vim.cmd("bnext")
end, "Next buffer")
leader_nmap("[", function()
	vim.cmd("bprevious")
end, "Previous buffer")
