local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.diagnostic.config({
  virtual_text = {
    severity = vim.diagnostic.severity.L
  }
})

require('mason').setup()
require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = require('keymaps.lsp-attach'),
    }
  end,
  ["lua_ls"] = function()
    require 'lspconfig'.lua_ls.setup {
      on_attach = require('keymaps.lsp-attach'),
      capabilities = capabilities,
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
      },
    }
  end,
  ["clangd"] = function()
    require 'lspconfig'.clangd.setup {
      on_attach = require("keymaps.lsp-attach"),
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        '--background-index', '--clang-tidy',
        '--log=verbose'
      }
    }
  end,
  -- Experimenting with Rustaceanvim: https://github.com/mrcjkb/rustaceanvim
  -- ["rust_analyzer"] = function()
  --   require 'lspconfig'.rust_analyzer.setup {
  --     settings     = {
  --       ["rust-analyzer"] = {
  --         checkOnSave = {
  --           command = "clippy"
  --         }
  --       }
  --     },
  --     capabilities = capabilities,
  --     on_attach    = function(client, bufnr)
  --       require('keymaps.lsp-attach')(client, bufnr)
  --       vim.lsp.inlay_hint.enable()
  --     end }
  -- end
}
