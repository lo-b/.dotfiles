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
set updatetime=500

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let mapleader = " "
let g:highlightedyank_highlight_duration = 500
let g:completion_timer_cycle = 200 "default value is 80

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
call plug#end()

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
augroup end

lua require('lspconfig').jdtls.setup({on_attach=require('completion').on_attach})
" imap <silent> <c-p> <Plug>(completion_trigger)
lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

""" REMAPS
"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)

" Use completion-nvim in every buffer
autocmd BufEnter * lua require('completion').on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Indenting
vnoremap < <gv
vnoremap > >gv

" GIT
nmap <leader>gs :G<CR>
nmap <leader>gp :G push<CR>
nmap <leader>jj :GitGutterNextHunk<CR>
nmap <leader>kk :GitGutterPrevHunk<CR>
nmap <leader>ghp :GitGutterPreviewHunk<CR>
map <C-j> ]c
map <C-k> [c


" Using telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" LSP remaps
nnoremap <A-CR> <Cmd>lua require('jdtls').code_action()<CR>
vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>

