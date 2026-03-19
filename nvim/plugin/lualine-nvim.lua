local colors = {
  black = '#282828',
  white = '#ebdbb2',
  red = '#fb4934',
  green = '#b8bb26',
  blue = '#83a598',
  yellow = '#fe8019',
  gray = '#a89984',
  darkgray = '#3c3836',
  lightgray = '#504945',
  inactivegray = '#7c6f64',
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      windows_color = {
        -- Same values as the general color option can be used here.
        active = 'pink', -- Color for active window.
        inactive = 'grey', -- Color for inactive window.
      },
    },
    lualine_c = {
      windows_color = {
        -- Same values as the general color option can be used here.
        active = 'pink', -- Color for active window.
        inactive = 'grey', -- Color for inactive window.
      },
    },
    lualine_x = {
      windows_color = {
        -- Same values as the general color option can be used here.
        active = 'pink', -- Color for active window.
        inactive = 'grey', -- Color for inactive window.
      },
    },
    lualine_y = {

      windows_color = {
        -- Same values as the general color option can be used here.
        active = 'pink', -- Color for active window.
        inactive = 'grey', -- Color for inactive window.
      },
    },
    lualine_z = {
      windows_color = {
        -- Same values as the general color option can be used here.
        active = 'pink', -- Color for active window.
        inactive = 'grey', -- Color for inactive window.
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
