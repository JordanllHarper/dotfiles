local leader_nmap = require('utils').leader_nmap
local batch_map = require('utils').batch_map

local mappings = {
    { "Rt", "<Cmd>Cargo test<CR>",           "[R]ust [t]est" },
    { "Ra", "<Cmd>RustAnalyzer restart<CR>", "[R]ust [a]nalyzer restart" },
}

batch_map(mappings, leader_nmap)
