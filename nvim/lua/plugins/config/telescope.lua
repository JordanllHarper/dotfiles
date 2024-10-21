local default_keymaps = {
  ['<C-b>'] = function(prompt_bufnr)
    require('telescope.actions').delete_buffer(prompt_bufnr)
  end,
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
leaderNmap('sh', builtin.help_tags, '[S]earch [H]elp')
leaderNmap('sH', builtin.search_history, '[S]earch [H]istory')
leaderNmap('sg', builtin.live_grep, '[S]earch by [G]rep')
leaderNmap('sG', builtin.git_bcommits, '[S]earch [G]it commits')
leaderNmap('ss', builtin.git_status, '[S]earch [S]tatus')
leaderNmap('su', '<CMD>Telescope undo<CR>', '[S]earch [U]ndo')
leaderNmap('sr', builtin.resume, '[S]earch [R]esume')
leaderNmap('sR', builtin.registers, '[S]earch [R]egisters')
leaderNmap('sk', builtin.keymaps, '[S]earch [K]eymaps')
leaderNmap('st', builtin.builtin, '[S]earch [T]elescope')
leaderNmap('sq', builtin.quickfix, '[S]earch [Q]uick Fix')
leaderNmap('sw', builtin.grep_string, '[S]earch current [W]ord')

leaderNmap('C', function()
    builtin.find_files { cwd = "~/.config/nvim/lua" }
  end, '[S]earch [C]onfiguration')
