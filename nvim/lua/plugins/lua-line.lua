return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts         = {
    options = {
      icons_enabled = true,
      theme = 'kanagawa',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
    extensions = { 'lazy', 'fugitive' },
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(displayed_mode)
            return displayed_mode:sub(1, 1)
          end,
        }
      },
      lualine_b = {
        { 'diff' },
      },
      lualine_c = {
        { 'buffers', },
      },
      lualine_x = {
        { 'diagnostics' },
      },
      lualine_y = { { 'branch', }, },
      lualine_z = { { 'location', },
        { 'progress' },
        { 'datetime', style = "%H:%M" },
      },
    },
  },
}
