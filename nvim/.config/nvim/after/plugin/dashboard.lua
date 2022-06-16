local db = require "dashboard"

db.default_executive = "telescope"
db.preview_command = "cat | lolcat --truecolor --seed 4 -F 0.05"
db.preview_file_path = "~/.config/nvim/banner.txt"
db.preview_file_height = 7
db.preview_file_width = 80
db.custom_center = {
  {
    icon = "🔄 ",
    desc = "Recently opened files                   ",
    action = "Telescope oldfiles prompt_prefix=🔄  ",
    shortcut = "SPC o o",
  },
  {
    icon = "🔍 ",
    desc = "Find  File                              ",
    action = "Telescope find_files find_command=rg,--hidden,--files",
    shortcut = "SPC f f",
  },
  {
    icon = "📁 ",
    desc = "File Browser                            ",
    action = "Telescope file_browser",
    shortcut = "SPC f t",
  },
  {
    icon = "🚀 ",
    desc = "Find  word                              ",
    action = "Telescope live_grep prompt_prefix=🚀  ",
    shortcut = "SPC f w",
  },
}
