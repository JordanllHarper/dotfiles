local map = require 'utils'.map
local nmap = require 'utils'.nmap
local leaderNmap = require 'utils'.leaderNmap

-- Quickfix
leaderNmap('qo', '<Cmd>copen<CR>', '[Q]uickfix [O]pen')

-- Terminal
leaderNmap('t', '<Cmd>term<CR>', '[T]erminal')
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
