local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconf = require("lspconfig")

vim.diagnostic.config({
	virtual_text = true,
})

---Default configuration func
---@param server_name string
---@param user_config table?
local function default_configure(server_name, user_config)
	local user_settings = user_config or {}
	lspconf[server_name].setup({
		capabilities = user_settings.capabilities or capabilities,
		on_attach = user_settings.on_attach or require("lsp-attach"),
		on_init = user_settings.on_init,
		settings = user_settings.settings,
		cmd = user_settings.cmd,
		filetypes = user_settings.filetypes,
	})
end

vim.lsp.inlay_hint.enable(true)

-- !!! SETUP SERVERS !!!

lspconf.lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			return
		end
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
			},
		})
	end,
	on_attach = function(_, bufnr)
		-- override formatting providers
		require("lsp-attach")(_, bufnr)
		vim.keymap.set("n", "<leader>f", function()
			require("stylua-nvim").format_file()
			print("Formatted Lua file with stylua")
		end, { desc = "[f]ormat with stylua", buffer = bufnr })
	end,

	settings = {
		Lua = {
			completion = {
				callSnippet = "Both",
				displayContext = 1,
			},
		},
	},
})

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
default_configure("marksman", {
	on_attach = function(_, bufnr)
		require("lsp-attach")(_, bufnr)
		-- override lsp buf format
		vim.keymap.set("n", "<leader>f", function()
			vim.system({ "mdformat", vim.fn.expand("%") })
			print("Formatted Markdown file with mdformat")
		end, { desc = "Format with mdformat", buffer = bufnr })
	end,
})

local swift_capabilities = vim.tbl_deep_extend(
	"force",
	capabilities,
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
