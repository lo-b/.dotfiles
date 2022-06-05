require("lualine").setup {
  options = {
    lower = false,
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    padding = 3,
    globalstatus = true,
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true, -- displays diff status in color if set to true
        -- all colors are in format #rrggbb
        color_added = nil, -- changes diff's added foreground color
        color_modified = nil, -- changes diff's modified foreground color
        color_removed = nil, -- changes diff's removed foreground color
        symbols = {added = '+', modified = '~', removed = '-'} -- changes diff symbols
      }
    },
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = {
      {
        "diagnostics",
        symbols = {error = '🔥', warn = '⚡', info = '💡'}
      },
      "encoding",
      "fileformat",
      {
        'filetype',
        colored = true -- displays filetype icon in color if set to `true`
      }
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
