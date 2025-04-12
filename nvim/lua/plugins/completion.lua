return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      local ls = require 'luasnip'
      local map = require('utils').map

      ls.config.setup {
        setup = {
          enable_autosnippets = true,
        },
      }

      for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
        loadfile(ft_path)()
      end

      -- jump backwards
      map({ 'n', 'i', 's' }, "<C-a>", function()
        if ls.jumpable() then
          ls.jump(-1)
        end
      end)

      -- jump forwards
      map({ 'n', 'i', 's' }, "<C-b>", function()
        if ls.jumpable() then
          ls.jump(1)
        end
      end)
    end
  },
  {
    'saghen/blink.cmp',
    dependencies = "L3MON4D3/LuaSnip",

    version = '*',

    opts = {
      cmdline = {
        completion = {
          menu = {
            auto_show = true,
          }
        }
      },
      snippets = {
        preset = 'luasnip',
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
        },
      },
      keymap = {
        preset = 'default',
        ['<C-h>'] = { 'show' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<Tab>'] = {},
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      signature = { enabled = true }
    },
  }
}
