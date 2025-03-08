require("zen-mode").setup {
  window = {
    backdrop = 1,
    width = 0.8,
    height = 1,
    options = {
      signcolumn = "yes",
      colorcolumn="",
      cursorcolumn = false,
      number = true,
      relativenumber = false,
      list=false,
      wrap=true,
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
      laststatus = 0,
    },
    tmux = { enabled = false },
    kitty = {
      enabled = true,
      font = "+5",
    },
  },
}
