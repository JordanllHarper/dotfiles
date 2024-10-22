local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconf = require('lspconfig')

vim.diagnostic.config({
  virtual_text = true,
})

local function default_configure(server_name, user_config)
  local user_settings = user_config or {}
  lspconf[server_name].setup {
    capabilities = user_settings.capabilities or capabilities,
    on_attach = user_settings.on_attach or require('keymaps.lsp-attach'),
    on_init = user_settings.on_init or {},
    settings = user_settings.settings or {},
    cmd = user_settings.cmd or nil
  }
end

vim.lsp.inlay_hint.enable(true)


-- 
-- !!! SETUP SERVERS !!!
--

default_configure('lua_ls',
  {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
        return
      end
      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = "LuaJIT"
        },
        workspace = {
          checkThirdParty = false,
        },
      })
    end,
    settings = {
      Lua = {
        completion = {
          callSnippet = "Both",
          displayContext = 1
        },
      },
    }
  }
)

default_configure('clangd',
  {
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
      '--background-index', '--clang-tidy',
      '--log=verbose'
    }
  }
)

default_configure('bashls')
default_configure('cmake')
default_configure('cssls')
default_configure('css_variables')
default_configure('cssmodulesls')
default_configure('gopls')
