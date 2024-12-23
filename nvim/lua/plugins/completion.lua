return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  version = '*',

  opts = {
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
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = { enabled = true }
  },
}
