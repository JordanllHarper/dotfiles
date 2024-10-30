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
map({'n', 'i', 's' }, "<C-s>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end)
