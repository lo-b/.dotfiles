require("bufferline").setup {
  options = {
    indicator_icon = " ▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "🏷️",
    left_trunc_marker = "",
    right_trunc_marker = "",
    separator_style = "slant"
  },
  highlights = {
    fill = {
      guifg = "#313335",
      guibg = "#313335"
    },
    tab_close = {
      guibg = "#313335"
    },
    separator = {
      guifg = "#313335",
    },
    separator_selected = {
      guifg = "#313335",
    },
    separator_visible = {
      guifg = "#313335",
    },
  },
}
