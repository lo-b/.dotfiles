local map = vim.api.nvim_set_keymap
options = { noremap = true, silent = true }

map("v", "<", "<gc", options)
map("v", ">", ">gc", options)

-- Maximizer
map("n", "<leader>m", ":MaximizerToggle!<CR>", options)

-- Fix for netrw-gx
map("n", "gx", ":execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>", options)

-- Trouble
map("n", "<leader>t", ":TroubleToggle<CR>", options)


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

-- Fugative GIT
map("n", "<leader>gg", ":G<CR>", options)
map("n", "<leader>gp", ":G push<CR>", options)

-- Zen mode using goyo
map("n", "<leader>z", ":Goyo 80%+25%x80%-25%<CR>", options)

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

-- Telescope git remaps
map("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>", options)
map("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches({ prompt_prefix = ' ' })<cr>", options)
map("n", "<leader>gs", "<cmd>lua require('telescope.builtin').git_stash({ prompt_prefix = '  ' })<cr>", options)
map("n", "<leader>ss", "<cmd>lua require('telescope.builtin').git_status({prompt_prefix='  ' })<cr>", options)
-- Telescope searching
map("n", "<leader>hh", "<cmd>lua require('telescope.builtin').command_history({ prompt_prefix = '  ' })<cr>", options)
map("n", "<leader>fG", "<cmd>lua require('telescope.builtin').live_grep({ prompt_prefix= '🚀 '})<cr>", options)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ prompt_prefix= '📖 '})<cr>", options)
map("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string({ prompt_prefix= '>>> ', search = vim.fn.input('Grep For > ')})<cr>", options)
map("n", "<leader>:", " <cmd>lua require('telescope.builtin').commands({ prompt_prefix = '  ' })<cr>", options)
map("n", "<leader>sh", "<cmd>lua require('telescope.builtin').search_history({ prompt_prefix = '  ' })<cr>", options)

-- Telescope moving around
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers({prompt_prefix= '𧻓 '})<cr>", options)
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ prompt_prefix= '🗃️ ', hidden = true })<cr>", options)
map("n", "<leader>ft", ":Telescope file_browser<cr>", options)
map("n", "<leader>oo", " <cmd>lua require('telescope.builtin').oldfiles({ prompt_prefix = '  ' })<cr>", options)

-- Telescope help
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags({prompt_prefix= '🤔 '})<cr>", options)
map("n", "<leader>fH", "<cmd>lua require('telescope.builtin').man_pages({prompt_prefix= '  '})<cr>", options)
map("n", "<leader>lk", "<cmd>lua require('telescope.builtin').keymaps({ prompt_prefix = '  ' })<cr>", options)

-- Telescope lsp
map("n", "<leader>tt", "<cmd>lua require('telescope.builtin').treesitter({ prompt_prefix = '  ' })<cr>", options)
map("n", "<leader>Q", "<cmd>lua require('telescope.builtin').quickfix({prompt_prefix='📜 ' })<cr>", options)
map("n", "<leader>gr", "<cmd>lua require('telescope.builtin').lsp_references({prompt_prefix='🛠️ ' })<cr>", options)

-- Debugging using vimspector
map("n", "<leader>dd", ":call vimspector#Launch(v:true)<cr>", options)
map("n", "<leader>de", "<cmd>VimspectorReset<cr>", options)
map("n", "<leader>dl", "<Plug>VimspectorStepInto", options)
map("n", "<leader>dj", "<Plug>VimspectorStepOver", options)
map("n", "<leader>dk", "<Plug>VimspectorStepOut", options)
map("n", "<leader>d_", "<Plug>VimspectorRestart", options)
map("n", "<leader>d<space>", ":call vimspector#Continue()<CR>", options)
map("n", "<leader>dp", "<Plug>VimspectorToggleBreakpoint", options)
map("n", "<leader>dcp", "<Plug>VimspectorToggleBreakpoint", options)

map("n", "<space><space>x", "<Plug>JupyterExecute", options)
map("n", "<space><space>X", "<Plug>JupyterExecuteAll", options)

-- Keep visual block selected after width shift.
map("v", ">", ">gv", options)
map("v", "<", "<gv", options)

-- Jumplist mutations
_ = vim.cmd [[
nnoremap <expr> k (v:count >5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count >5 ? "m'" . v:count : "") . 'j'
]]

-- ALE toggle
map("n", "<leader>a", ":ALEToggle<CR>", options)
