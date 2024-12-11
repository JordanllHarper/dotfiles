local default_keymaps = {
  ['<C-b>'] = require('telescope.actions').delete_buffer,
  ['<C-s>'] = require 'telescope.actions'.select_horizontal
}
local opts = {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      prompt_position = 'top',
    },
    mappings = {
      n = default_keymaps,
      i = default_keymaps,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    undo = {}
  }
}

require('telescope').setup(opts)
local ts = require 'telescope'
ts.load_extension 'fzf'
ts.load_extension 'undo'

-- telescope keymaps
local builtin = require('telescope.builtin')

local leaderNmap = require 'utils'.leaderNmap

leaderNmap('?', builtin.oldfiles, '[?] Find recently opened files')
leaderNmap('<leader>', builtin.buffers, '[ ] Find existing buffers')
leaderNmap('/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, '[/] Fuzzily search in current buffer')

-- NOTE: None LSP functionality
leaderNmap('sF', function() builtin.find_files { hidden = true, } end,
  '[S]earch All [F]iles (including hidden)')
leaderNmap('sf', builtin.find_files,
  '[S]earch [F]iles')
leaderNmap('sh', builtin.help_tags, '[s]earch [h]elp')
leaderNmap('sH', builtin.search_history, '[s]earch [H]istory')
leaderNmap('sg', builtin.live_grep, '[s]earch by [g]rep')
leaderNmap('su', '<CMD>Telescope undo<CR>', '[s]earch [u]ndo')
leaderNmap('sr', builtin.resume, '[s]earch [r]esume')
leaderNmap('sR', builtin.registers, '[s]earch [r]egisters')
leaderNmap('sS', builtin.spell_suggest, "[s]earch [S]pelling")
leaderNmap('sk', builtin.keymaps, '[s]earch [k]eymaps')
leaderNmap('sw', builtin.grep_string, '[s]earch current [w]ord')

leaderNmap('C', function()
  builtin.find_files { cwd = "~/.config/nvim/lua" }
end, '[S]earch [C]onfiguration')
