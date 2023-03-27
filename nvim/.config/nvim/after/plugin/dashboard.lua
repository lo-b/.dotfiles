local db = require "dashboard"

db.setup {
  theme = "hyper",
  config = {
    shortcut = {
      {
        desc = " Update",
        group = "@property",
        action = "Lazy update",
        key = "u",
      },
      {
        desc = " Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f",
      },
      {
        desc = " Apps",
        group = "DiagnosticHint",
        action = "Telescope app",
        key = "a",
      },
      {
        desc = " dotfiles",
        group = "Number",
        action = "Telescope dotfiles",
        key = "d",
      },
    },
  },
  preview = {
    command = "cat | lolcat --truecolor --seed 4 -F 0.05",
    file_path = "~/.config/nvim/banner.txt",
    file_height = 7,
    file_width = 80,
  },
}
