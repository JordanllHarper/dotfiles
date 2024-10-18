local cmp = require 'cmp'
local ls = require 'luasnip'
local lspkind = require 'lspkind'
require('luasnip.loaders.from_vscode').lazy_load()
ls.config.setup {
  setup = {
    enable_autosnippets = true,
  },
}

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
  loadfile(ft_path)()
end


vim.keymap.set({ 'i', 's' }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })
vim.keymap.set({ 'i', 's' }, "<C-j>", function()
  if ls.jumpable() then
    ls.jump(-1)
  end
end, { silent = true })

cmp.setup {
  formatting = {
    expandable_indicator = true,
    format = lspkind.cmp_format(),
  },
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-h>'] = cmp.mapping.complete {},
    ['<C-l>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ['CR'] = {}
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'crates' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp_document_symbol' },
  }, {
  { name = "buffer" },
}
}

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' }
  }, {
    { name = 'buffer' }
  })
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
})
