local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map("v", "<", "<gc", options)
map("v", ">", ">gc", options)

-- Maximizer
map("n", "<leader>m", ":MaximizerToggle!<CR>", options)

-- Fix for netrw-gx
map(
  "n",
  "gx",
  ":execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>",
  options
)

-- Trouble
map("n", "<leader>T", ":Trouble<CR>", options)

-- Vista remap
map("n", "<leader>v", ":Vista<CR>", options)

-- Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
map("v", "<Enter>", "<Plug>(EasyAlign)", options)

-- Easier naviagtion in nvim windows than cumborsome defaults.
map("n", "<C-h>", "<C-W>h", options)
map("n", "<C-j>", "<C-W>j", options)
map("n", "<C-k>", "<C-W>k", options)
map("n", "<C-l>", "<C-W>l", options)

-- Clear highlighting on escape in normal mode
map("n", "<esc>", ":noh<return><esc>", options)
map("n", "<esc>^[", "<esc>^[", options)

-- Fugitive GIT
map("n", "<leader>gg", ":G<CR>", options)
map("n", "<leader>gp", ":G push<CR>", options)

-- Zen mode using goyo
map("n", "<leader>z", ":ZenMode<CR>", options)

-- Make `Y` behave to copy trailing text
map("n", "Y", "y$", options)

-- Stay centered when merging lines or going trough searches with n/N
map("n", "n", "nzzzv", options)
map("n", "N", "Nzzzv", options)
map("n", "J", "mzJ`z", options)

-- Undo breakpoints
map("i", ",", ",<c-g>u", options)
map("i", ".", ".<c-g>u", options)
map("i", "!", "!<c-g>u", options)
map("i", ",", ",<c-g>u", options)

-- Global LSP Remaps
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", options)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", options)
map("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", options)

-- Telescope git remaps
map(
  "n",
  "<leader>gc",
  "<cmd>lua require('telescope.builtin').git_commits()<cr>",
  options
)
map(
  "n",
  "<leader>gb",
  "<cmd>lua require('telescope.builtin').git_branches({ prompt_prefix = '🌿 ' })<cr>",
  options
)
map(
  "n",
  "<leader>gs",
  "<cmd>lua require('telescope.builtin').git_stash({ prompt_prefix = '🧪 ' })<cr>",
  options
)
map(
  "n",
  "<leader>ss",
  "<cmd>lua require('telescope.builtin').git_status({prompt_prefix='📰 ' })<cr>",
  options
)
-- Telescope searching
map(
  "n",
  "<leader>hh",
  "<cmd>lua require('telescope.builtin').command_history({ prompt_prefix = '⏪ ' })<cr>",
  options
)
map(
  "n",
  "<leader>fG",
  "<cmd>lua require('telescope.builtin').live_grep({ prompt_prefix= '🚀 '})<cr>",
  options
)
map(
  "n",
  "<leader>fg",
  "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ prompt_prefix= '📖 '})<cr>",
  options
)
map(
  "n",
  "<leader>fs",
  "<cmd>lua require('telescope.builtin').grep_string({ prompt_prefix= '>>> ', search = vim.fn.input('Grep For > ')})<cr>",
  options
)
map(
  "n",
  "<leader>:",
  " <cmd>lua require('telescope.builtin').commands({ prompt_prefix = '🤖 ' })<cr>",
  options
)
map(
  "n",
  "<leader>sh",
  "<cmd>lua require('telescope.builtin').search_history({ prompt_prefix = '⌛ ' })<cr>",
  options
)

-- Telescope moving around
map(
  "n",
  "<leader>fb",
  "<cmd>lua require('telescope.builtin').buffers({prompt_prefix= '📚 '})<cr>",
  options
)
map(
  "n",
  "<leader>ff",
  "<cmd>lua require('telescope.builtin').find_files({ prompt_prefix= '🗃️ ', hidden = true })<cr>",
  options
)
map("n", "<leader>fm", ":Telescope media_files<cr>", options)
map("n", "<leader>ft", ":Telescope file_browser<cr>", options)
map(
  "n",
  "<leader>oo",
  " <cmd>lua require('telescope.builtin').oldfiles({ prompt_prefix = '🔄 ' })<cr>",
  options
)

-- Telescope help
map(
  "n",
  "<leader>fh",
  "<cmd>lua require('telescope.builtin').help_tags({prompt_prefix= '🤔 '})<cr>",
  options
)
map(
  "n",
  "<leader>fH",
  "<cmd>lua require('telescope.builtin').man_pages({prompt_prefix= '📃 '})<cr>",
  options
)
map(
  "n",
  "<leader>lk",
  "<cmd>lua require('telescope.builtin').keymaps({ prompt_prefix = 'ℹ️ ' })<cr>",
  options
)

-- Telescope lsp
map(
  "n",
  "<leader>tt",
  "<cmd>lua require('telescope.builtin').treesitter({ prompt_prefix = '🌳 ' })<cr>",
  options
)
map(
  "n",
  "<leader>Q",
  "<cmd>lua require('telescope.builtin').quickfix({prompt_prefix='📜 ' })<cr>",
  options
)
map(
  "n",
  "<leader>gr",
  "<cmd>lua require('telescope.builtin').lsp_references({prompt_prefix='🛠️ ' })<cr>",
  options
)

map(
  "n",
  "<leader>sp",
  "<cmd>lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_dropdown({prompt_prefix='🛠️ ' }))<cr>",
  options
)

-- JupyterAscending vim for jupyter notebooks
map("n", "<space><space>x", "<Plug>JupyterExecute", options)
map("n", "<space><space>X", "<Plug>JupyterExecuteAll", options)

-- Keep visual block selected after width shift.
map("v", ">", ">gv", options)
map("v", "<", "<gv", options)

-- Enable/disable diagnostics
map("n", "<space>a", ":lua vim.diagnostic.disable()<cr>", options)
map("n", "<space>A", ":lua vim.diagnostic.enable()<cr>", options)

-- Jumplist mutations
_ = vim.cmd [[
nnoremap <expr> k (v:count >5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count >5 ? "m'" . v:count : "") . 'j'
]]

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", options)
map("n", "<leader>E", ":NvimTreeFindFile<CR>", options)
map("n", "<leader>tf", ":NvimTreeFindFile<CR>", options)
map("n", "<leader>tr", ":NvimTreeRefresh<CR>", options)

-- oil
-- open parent directory in current window
map("n", "-", "<CMD>Oil<CR>", options)
map("n", "<leader>-", ":lua require('oil').toggle_float()<CR>", options)

