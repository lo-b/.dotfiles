local has_refactoring, refactoring = pcall(require, "refactoring")
if not has_refactoring then
  return
end

local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true, expr = false }

refactoring.setup {}

-- Remaps for the refactoring operations currently offered by the plugin
set(
  "v",
  "<leader>re",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
  opts
)
set(
  "v",
  "<leader>rf",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
  opts
)
set(
  "v",
  "<leader>rv",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
  opts
)
set(
  "v",
  "<leader>ri",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
  opts
)

-- Extract block doesn't need visual mode
set(
  "n",
  "<leader>rb",
  [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
  opts
)
set(
  "n",
  "<leader>rbf",
  [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
  opts
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
set(
  "n",
  "<leader>ri",
  [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
  opts
)

-- prompt for a refactor to apply when the remap is triggered
set(
  "v",
  "<leader>rr",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors(require('telescope.themes').get_dropdown({prompt_prefix=' ⚗️  '}))<CR>",
  { noremap = true }
)
