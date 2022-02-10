local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = "🔭 ",
    selection_caret = "👉 ",
    path_display = { "smart" },
    file_ignore_patterns = {"**/*%.git", "**/*.pdf"},
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-."
    },
    mappings = {
      i = {
        ["<C-q>"] = actions.smart_send_to_qflist,
        ["<C-a>"] = actions.delete_buffer,
      },
      n = {
        ["<C-a>"] = actions.delete_buffer,
      },
    },
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
    fzy_native = {
      override_genereic_sorter = false,
      override_file_sorter = true,
    }
  }
}
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("media_files")
require("telescope").load_extension("file_browser")
