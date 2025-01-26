---@return lsp.ClientCapabilities
local capabilities = function() return require("blink-cmp").get_lsp_capabilities() end
local lspconf = require("lspconfig")

vim.diagnostic.config({
	severity_sort = true,
})

---Default configuration func
---@param server_name string
---@param user_config table?
local function default_configure(server_name, user_config)
	local user_settings = user_config or {}
	lspconf[server_name].setup({
		capabilities = user_settings.capabilities or capabilities(),
		on_attach = user_settings.on_attach or require("lsp-attach"),
		on_init = user_settings.on_init,
		settings = user_settings.settings,
		cmd = user_settings.cmd,
		filetypes = user_settings.filetypes,
	})
end


vim.lsp.inlay_hint.enable(true)

-- !!! SETUP SERVERS !!!

default_configure("lua_ls")
default_configure("clangd", {
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
		"--background-index",
		"--clang-tidy",
		"--log=verbose",
	},
})
default_configure("bashls")
default_configure("cmake")
default_configure("gopls")
default_configure("ruby_lsp")
default_configure("marksman")
default_configure("pyright")
local json_capabilities = capabilities()
json_capabilities.textDocument.completion.completionItem.snippetSupport = true
default_configure("jsonls", {
	capabilities = json_capabilities
})

local swift_capabilities = vim.tbl_deep_extend(
	"force",
	capabilities(),
	{ workspace = { didChangeWatchedFile = { dynamicRegistration = true } } }
)

default_configure("sourcekit", { capabilities = swift_capabilities })
default_configure(
	"java_language_server",
	{ cmd = { vim.fn.expand("$HOME") .. "/java-language-server/dist/lang_server_mac.sh" } }
)

local omnisharp = vim.fn.expand("$OMNISHARP_PATH")
default_configure("omnisharp", {
	cmd = { "dotnet", omnisharp },
})
