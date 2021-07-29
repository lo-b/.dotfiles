" To get info about settings use `:h <option>`.
set expandtab tabstop=2 softtabstop=2
set shiftwidth=2

autocmd Filetype py setlocal tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nohlsearch

" Use absolute line number instead of '0'.
set nu
set noerrorbells
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set clipboard+=unnamedplus
set nowrap
set updatetime=100

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Enable mouse settings
set mouse=a

set listchars=tab:->,trail:·
set list

" nvim-colorizer
set termguicolors

" Finally found it... Setting to change the default E icon from errors
sign define LspDiagnosticsSignError text=🔥 texthl=GruvboxRed
sign define LspDiagnosticsSignWarning text=⚡ texthl=GruvboxYellow

let mapleader = " "
let g:highlightedyank_highlight_duration = 500
let g:completion_timer_cycle = 200 "default value is 80

" indentLine
let g:indentLine_char = '🭳'
let g:indent_blankline_filetype_exclude = ['help', 'startify']

" GitGutter
let g:gitgutter_max_signs = 500

" ALE settings
" '*': ['remove_trailing_lines', 'trim_whitespace'],
let g:ale_completion_autoimport = 1
let g:ale_fixers = {
\  'java': ['google_java_format', 'uncrustify']
\}

" Sign settings
let g:ale_sign_priority = 90
let g:ale_sign_error = '🔥'
let g:ale_sign_info = '💡'
let g:ale_sign_warning = '⚡'
let g:ale_use_global_executables = 1

" Hover settings
let g:ale_floating_preview = 1
let g:ale_set_balloons = 1

" Linting settings
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1


" NERDTree settings
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

" Adds padding after the node's icon
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" vim-move
let g:move_key_modifier = 'C'
let g:move_map_keys = 1

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')


" Completion settings
let g:completion_trigger_keyword_length = 1 " default = 1


" Plugins
call plug#begin('~/.vim/plugged')
  Plug 'gruvbox-community/gruvbox'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'tpope/vim-commentary'
  Plug 'machakann/vim-highlightedyank'
  Plug 'tpope/vim-surround'
  Plug 'neovim/nvim-lspconfig'
  Plug 'mfussenegger/nvim-jdtls'
  Plug 'nvim-lua/completion-nvim'
  Plug 'dense-analysis/ale'
  " Lualine plugins
  Plug 'hoob3rt/lualine.nvim'
  Plug 'tweekmonster/startuptime.vim'
  Plug 'preservim/nerdtree'
  " File explorer tree
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Colored color codes
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'matze/vim-move'
  " Illuminate other usages of word
  Plug 'RRethy/vim-illuminate'
  Plug 'mhinz/vim-startify'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/goyo.vim'
  " Maximize plugin to toggle fullscreen
  Plug 'szw/vim-maximizer'
  " Devicons used by telescope
  Plug 'kyazdani42/nvim-web-devicons'
  " Trouble plugins
  Plug 'folke/trouble.nvim', { 'branch': 'main' }
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'dbeniamine/cheat.sh-vim'
call plug#end()

" Startify
autocmd User Startified setlocal cursorline

let g:startify_enable_special      = 0
let g:startify_files_number        = 8
let g:startify_relative_path       = 1
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1

let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ 'bundle/.*/doc',
        \ '/data/repo/neovim/runtime/doc',
        \ '/Users/mhi/local/vim/share/vim/vim74/doc',
        \ ]

let g:startify_bookmarks = [
        \ { 'c': '~/.dotfiles/nvim/.config/nvim/init.vim' },
        \ ]

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_custom_header = startify#center(startify#fortune#boxed())

colorscheme gruvbox
highlight Normal guibg=none

" Remove white space on save.
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup TRIM_ON_SAVE
  autocmd!
  " Before saving any file call function to trim.
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

augroup lsp
  au!
  au FileType java lua require('jdtls').start_or_attach({cmd = {'jdtls'}})
  au BufEnter,FileType java lua require'completion'.on_attach()
augroup end


lua << EOF
require('colorizer').setup()
require('telescope').setup{
  defaults = {
    prompt_prefix = "🔭 ",
    selection_caret = "👉 ",
    path_display = { 'smart' },
    file_ignore_patterns = {"**.git"},
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
  }
}
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_material',
    component_separators = {'', ''},
    section_separators = {'', ''},
    padding = 2,
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true, -- displays diff status in color if set to true
        -- all colors are in format #rrggbb
        color_added = nil, -- changes diff's added foreground color
        color_modified = nil, -- changes diff's modified foreground color
        color_removed = nil, -- changes diff's removed foreground color
        symbols = {added = '+', modified = '~', removed = '-'} -- changes diff symbols
      }
    },
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = {
      {
        "diagnostics",
        sources = {"ale"},
        sections = {'error', 'warn', 'info'},
        symbols = {error = '🔥', warn = '⚡', info = '💡'}
      },
      "encoding",
      "fileformat",
      {
        'filetype',
        colored = true -- displays filetype icon in color if set to `true`
      }
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
-- Extend nvim-jdtls UI to use telescope
local finders = require'telescope.finders'
local sorters = require'telescope.sorters'
local actions = require'telescope.actions'
local pickers = require'telescope.pickers'
require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
  local opts = {}
  pickers.new(opts, {
    prompt_title = prompt,
    finder    = finders.new_table {
      results = items,
      entry_maker = function(entry)
        return {
          value = entry,
          display = label_fn(entry),
          ordinal = label_fn(entry),
        }
      end,
    },
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = actions.get_selected_entry(prompt_bufnr)
        actions.close(prompt_bufnr)

        cb(selection.value)
      end)

      return true
    end,
  }):find()
end
require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    use_lsp_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  }
}
EOF


""" REMAPS
"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Indenting
vnoremap < <gv
vnoremap > >gv

" GIT
nmap <leader>gs :G<CR>
nmap <leader>gp :G push<CR>
nmap <leader>hp :GitGutterPreviewHunk<CR>
nmap <leader>hu :GitGutterUndoHunk<CR>

" Using telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep({ prompt_prefix= "🔎 "})<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers({prompt_prefix= "🗃️ "})<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags({prompt_prefix= "🤔 "})<cr>


" LSP remaps
nnoremap <leader>a <Cmd>lua require('jdtls').code_action()<CR>
vnoremap <leader>a <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
nmap gD <Cmd>lua vim.lsp.buf.definition()<CR>
nmap <S-k> <Cmd>lua vim.lsp.buf.hover()<CR>

" Zen mode using goyo
nmap <leader>z :Goyo<CR>

" Maximizer
nmap <leader>m :MaximizerToggle!<CR>
