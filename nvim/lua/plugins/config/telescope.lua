local default_keymaps = {
  ['<C-b>'] = require 'telescope.actions'.delete_buffer,
  ['<C-s>'] = require 'telescope.actions'.select_horizontal
}
local opts = {
  defaults = {
    layout_strategy = 'horizontal',
    sorting_strategy = 'ascending',
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
  }
}
local ts = require 'telescope'

ts.setup(opts)
ts.load_extension 'fzf'

local themes = require "telescope.themes"
local dropdown = themes.get_dropdown {
  winblend = 10,
  previewer = false,
}
local ivy = themes.get_ivy()
local builtin = require 'telescope.builtin'

local leaderNmap = require 'utils'.leader_nmap

leaderNmap('?', builtin.oldfiles, '[?] Find recently opened files')
leaderNmap('<leader>', function()
  builtin.buffers(themes.get_ivy())
end, '[ ] Find existing buffers')
leaderNmap('/', function()
  builtin.current_buffer_fuzzy_find(dropdown)
end, '[/] Fuzzily search in current buffer')

-- NOTE: None LSP functionality
leaderNmap('sF', function() builtin.find_files { hidden = true, } end,
  '[S]earch All [F]iles (including hidden)')
leaderNmap('sf', builtin.find_files,
  '[S]earch [F]iles')
leaderNmap('sh', builtin.help_tags, '[s]earch [h]elp')
leaderNmap('sH', builtin.search_history, '[s]earch [H]istory')
leaderNmap('sg', builtin.live_grep, '[s]earch by [g]rep')
leaderNmap('sr', builtin.resume, '[s]earch [r]esume')
leaderNmap('sR', builtin.registers, '[s]earch [r]egisters')
leaderNmap('sS', function()
    builtin.spell_suggest(themes.get_cursor { border = true })
  end,
  "[s]earch [S]pelling")
leaderNmap('sk', builtin.keymaps, '[s]earch [k]eymaps')
leaderNmap('sw', builtin.grep_string, '[s]earch current [w]ord')

-- Config
leaderNmap('C', function()
    builtin.find_files {
      themes.get_ivy(),
      cwd = "~/.config/nvim/lua" }
  end,
  '[S]earch [C]onfiguration'
)
