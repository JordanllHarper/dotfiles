return {
  {
    "L3MON4D3/LuaSnip",
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
      map({ 'n', 'i', 's' }, "<C-s>", function()
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
      'rafamadriz/friendly-snippets',
      { 'L3MON4D3/LuaSnip', version = 'v2.*' }
    },

    version = '*',

    opts = {
      snippets = {
        expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction) require('luasnip').jump(direction) end,
      },
      keymap = {
        preset = 'default',
        ['<C-l>'] = { 'select_and_accept' },
        ['<C-h>'] = { 'show' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'luasnip' },
      },
      signature = { enabled = true }
    },
  }
}
