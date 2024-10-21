local map = vim.keymap.set
local nmap = require 'utils'.nmap
local leaderNmap = require 'utils'.leaderNmap

-- Quickfix
leaderNmap('qo', '<Cmd>copen<CR>', '[Q]uickfix [O]pen')

-- Terminal
leaderNmap('t', function()
	vim.cmd("hor split")
	vim.cmd("winc j")
	vim.cmd.term()
end, "[T]erminal")

leaderNmap('S', function()
	vim.cmd("luafile %")
	vim.notify("Sourced current Lua file", vim.log.levels.INFO, {})
end, "[S]ource luafile")

map('t', '<C-q>', '<C-\\><C-n>', { silent = true, desc = '[Q]uit terminal mode' })

-- Lsp
leaderNmap('Li', '<Cmd>LspInfo<CR>', '[L]sp [I]nfo')
leaderNmap('Lr', '<Cmd>LspRestart<CR>', '[L]sp [R]estart')

-- -- Window resizing
local window_binding = '<C-w>'
nmap('<M-.>', window_binding .. '5< ')
nmap('<M-,>', window_binding .. '5>')
nmap('<M-t>', window_binding .. '+')
nmap('<M-s>', window_binding .. '-')
