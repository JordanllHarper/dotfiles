local ls = require 'luasnip'

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
