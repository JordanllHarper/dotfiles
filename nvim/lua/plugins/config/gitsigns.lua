local opts = {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    vim.keymap.set('n', '<leader>gh', gs.preview_hunk, { buffer = bufnr, desc = '[G]it [H]unk' })
    vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { buffer = bufnr, desc = '[G]it [S]tage' })
    vim.keymap.set('n', '<leader>gS', gs.stage_buffer,
      { buffer = bufnr, desc = '[G]it [S]tage (Buffer)' })

    vim.keymap.set('n', '<leader>ga', "<Cmd>Git add %<CR>",
      { buffer = bufnr, desc = '[G]it [A]dd current file' })

    vim.keymap.set('n', '<leader>gd', require('gitsigns').diffthis, { buffer = bufnr, desc = '[G]it [D]iff' })
    vim.keymap.set('n', '<leader>gr', require('gitsigns').reset_hunk, { buffer = bufnr, desc = '[G]it [R]eset Hunk' })
    vim.keymap.set('n', '<leader>gu', require('gitsigns').undo_stage_hunk,
      { buffer = bufnr, desc = '[G]it [U]ndo stage' })

    -- don't override the built-in and fugitive keymaps
    vim.keymap.set({ 'n', 'v' }, ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
    vim.keymap.set({ 'n', 'v' }, '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
  end,
}
require 'gitsigns'.setup(opts)
