require("zen-mode").setup {
  window = {
    backdrop = 1,
    width = 120,
    height = 1,
    options = {
      signcolumn = "no",
      colorcolumn = "",
      number = false,
      relativenumber = false,
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
    gitsigns = { enabled = true },
    tmux = { enabled = true },
    -- Kitty resizeing works in terminal but not from tmux(p)...
    kitty = {
      enabled = true,
      font = "+4",
    },
  },
}
