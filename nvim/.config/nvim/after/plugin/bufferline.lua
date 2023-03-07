require("bufferline").setup {
  options = {
    indicator = " ▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    separator_style = "thick",
  },
  highlights = {
    fill = {
      fg = "#313335",
      bg = "#313335",
    },
    tab_close = {
      bg = "#313335",
    },
    separator = {
      fg = "#313335",
    },
    separator_selected = {
      fg = "#313335",
    },
    separator_visible = {
      fg = "#313335",
    },
  },
}
