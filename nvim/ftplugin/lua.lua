require 'utils'
leaderNmap("S", function()
	vim.cmd('luafile %')
	vim.notify("Resourcing current luafile", vim.log.levels.INFO)
end, "[S]ource")

