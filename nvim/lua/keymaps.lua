local map = vim.keymap.set
local nmap = require("utils").nmap
local leaderNmap = require("utils").leader_nmap

-- Quickfix
leaderNmap("qo", "<Cmd>copen<CR>", "[Q]uickfix [O]pen")
nmap("]q", "<Cmd>cnext<CR>", "Next [Q]uickfix")
nmap("[q", "<Cmd>cprev<CR>", "Previous [Q]uickfix")

-- Terminal
leaderNmap("t", function()
	vim.cmd("hor split")
	vim.cmd("winc j")
	vim.cmd.term()
end, "[T]erminal")
--
map("t", "<C-q>", "<C-\\><C-n>", { silent = true, desc = "[Q]uit terminal mode" })

-- lua files
leaderNmap("S", function()
	vim.cmd("luafile %")
	vim.notify("Sourced current Lua file", vim.log.levels.INFO, {})
end, "[S]ource luafile")

map("v", "S", function()
	print("Sourcing current lua selection...")
	vim.cmd("'<,'>source")
end)

-- Lsp
leaderNmap("Li", "<Cmd>LspInfo<CR>", "[L]sp [I]nfo")
leaderNmap("Lr", "<Cmd>LspRestart<CR>", "[L]sp [R]estart")

-- Window resizing
local window_binding = "<C-w>"
nmap("<M-.>", window_binding .. "5< ")
nmap("<M-,>", window_binding .. "5>")
nmap("<M-t>", window_binding .. "+")
nmap("<M-s>", window_binding .. "-")

-- tabs
leaderNmap("]", function()
	vim.cmd("tabnext")
end, "Next tab")
leaderNmap("[", function()
	vim.cmd("tabprevious")
end, "Previous tab")
