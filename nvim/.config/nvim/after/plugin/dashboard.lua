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

-- db.default_executive = "telescope"
-- db.preview_command = "cat | lolcat --truecolor --seed 4 -F 0.05"
-- db.preview_file_path = "~/.config/nvim/banner.txt"
-- db.preview_file_height = 7
-- db.preview_file_width = 80
-- db.custom_center = {
--   {
--     icon = "🔄 ",
--     desc = "Recently opened files                   ",
--     action = "Telescope oldfiles prompt_prefix=🔄  ",
--     shortcut = "SPC o o",
--   },
--   {
--     icon = "🔍 ",
--     desc = "Find  File                              ",
--     action = "Telescope find_files find_command=rg,--hidden,--files",
--     shortcut = "SPC f f",
--   },
--   {
--     icon = "📁 ",
--     desc = "File Browser                            ",
--     action = "Telescope file_browser",
--     shortcut = "SPC f t",
--   },
--   {
--     icon = "🚀 ",
--     desc = "Find  word                              ",
--     action = "Telescope live_grep prompt_prefix=🚀  ",
--     shortcut = "SPC f w",
--   },
-- }
