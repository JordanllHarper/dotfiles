return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
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

    -- optional: provides snippets for the snippet source
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      { 'L3MON4D3/LuaSnip',            version = 'v2.*' }
    },

    version = '*',

    opts = {
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
        ['<C-l>'] = { 'select_and_accept' },
        ['<C-h>'] = { 'show' },
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
