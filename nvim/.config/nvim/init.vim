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

" Indent remaps
vnoremap < <gv
vnoremap > >gv

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

let mapleader = " "
let g:highlightedyank_highlight_duration = 500

lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

nmap <leader>gs :G<CR>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
