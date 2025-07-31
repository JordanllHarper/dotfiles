vim.diagnostic.config({
	severity_sort = true,
})

vim.lsp.inlay_hint.enable(true)

-- !!! SETUP SERVERS !!!


vim.lsp.config('*', {
	capabilities = require("blink-cmp").get_lsp_capabilities()
})

--- Configuration
---@type table<string | table<string, vim.lsp.Config>>
local servers = {
	"lua_ls",
	"bashls",
	"gopls",
	"ruby_lsp",
	"marksman",
	"pyright",
	"ocamllsp",
	{
		"clangd",
		---@type vim.lsp.Config
		{
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
				"--background-index",
				"--clang-tidy",
				"--log=verbose",
			},
		}
	}
}

for _, server in ipairs(servers) do
	local serverName = server
	if type(server) == "table" then
		serverName = server[1]
		local configuration = server[2]
		vim.lsp.config[serverName] = configuration
	end
	vim.lsp.enable(serverName)
end
