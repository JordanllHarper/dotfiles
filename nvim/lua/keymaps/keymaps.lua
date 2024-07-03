local mapUtils = require('utils')
local leaderNmap = mapUtils.leaderNmap
local map = mapUtils.map


-- Quickfix
leaderNmap('qo', '<Cmd>copen<CR>', '[Q]uickfix [O]pen')
leaderNmap('qc', '<Cmd>cclose<CR>', '[Q]uickfix [C]lose')
-- Terminal
leaderNmap('t', '<Cmd>term<CR>', '[T]erminal')
map('t', '<C-q>', '<C-\\><C-n>', '[Q]uit terminal mode')

-- Lsp
leaderNmap('Li', '<Cmd>LspInfo<CR>', '[L]sp [I]nfo')
leaderNmap('Lr', '<Cmd>LspRestart<CR>', '[L]sp [R]estart')

leaderNmap("S", function()
	vim.cmd('luafile %')
	vim.notify("Resourcing current luafile ", vim.log.levels.INFO)
end, "[S]ource")

-- Tabs
leaderNmap('u', "<Cmd>tabprevious<CR>", "Previous tab")
leaderNmap('p', "<Cmd>tabnext<CR>", "Next tab")
leaderNmap('N', "<Cmd>tabnew<CR>", "New tab")
leaderNmap('x', "<Cmd>tabclose<CR>", "Close tab")