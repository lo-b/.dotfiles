" To get info about settings use `:h <option>`.
lua require("bl.options")

let g:highlightedyank_highlight_duration = 500

" Vimtex settings
let g:vimtex_format_enabled = 1


" ALE settings
let g:ale_completion_enabled = 0
" You can now use it in g:ale_fixers
let g:ale_fixers = {
      \'javascript': ['eslint'],
      \'typescript': ['eslint', 'prettier'],
      \'tex': ['FormatTex'],
      \'go': ['gofmt']
      \}

let g:ale_linters = {
      \'tex': ['writegood', 'texlab'],
      \}

" Sign settings
let g:ale_sign_priority = 90
let g:ale_sign_error = '🔥'
let g:ale_sign_info = '💡'
let g:ale_sign_warning = '⚡'
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

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
" let g:move_key_modifier = 'A'
let g:move_map_keys = 1

" viml
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]


" Function to get all active buffers, used by nvr to (remotely) get all active
" buffers of a nvim instance.
function! GetActiveBuffers()
    let l:blist = getbufinfo({'bufloaded': 1, 'buflisted': 1})
    let l:result = []
    for l:item in l:blist
        "skip unnamed buffers; also skip hidden buffers?
        " if empty(l:item.name) || l:item.hidden
        "     continue
        " endif
        call add(l:result, shellescape(l:item.name))
    endfor
    return l:result
endfunction


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

lua require("bl.plugins")

let &t_ut=''


" Vexmtex settings
let g:vimtex_compiler_method = 'tectonic'
let g:vimtex_compiler_tectonic = {
    \ 'build_dir' : '',
    \ 'options' : [
    \   "--synctex",
    \   "--keep-logs",
    \ ],
    \}
let g:vimtex_view_method = 'zathura'

" The quickfix window is never opened/closed automatically.
let g:vimtex_quickfix_mode = 0


" Group below does not work when placed in it's ftplugin file `tex.vim` ...
augroup FormaxTexBuffer
  au!
  au BufWritePost *.tex call vimtex#compiler#start()
augroup end



" Custom latex formatter using latexindent docker image
function! FormatTex(buffer)
  silent execute '!latexindent /app/%'
  silent execute ':e'
endfunction

execute ale#fix#registry#Add('texfmt', 'FormatTex', ['tex'], 'texfmt for tex')



" Python formatter
let g:pydocstring_formatter = 'google'

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


" UltiSnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<s-c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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

" Darcula theme settings for ALE
hi! link ALEError Error
hi! link ALEWarning CodeWarning
hi! link ALEInfo CodeInfo
hi! link ALEErrorSign ErrorSign
hi! link ALEWarningSign WarningSign
hi! link ALEInfoSign InfoSign

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

lua << EOF
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').sqls.setup{
  settings = {
    sqls = {
      connections = {
        {
          alias = 'Shopping database',
          driver = 'sqlite3',
          dataSourceName = '/home/bram/dbs/sqlite/student-data.db',
        },
      },
    },
  },
}
require'lspconfig'.ansiblels.setup{
  capabilities = capabilities,
}
require'lspconfig'.rust_analyzer.setup{
  capabilities = capabilities,
}
require'lspconfig'.texlab.setup{
  capabilities = capabilities,
  cmd = { "texlab" },
  filetypes = { "tex", "bib" },
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        args = { "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
        executable = "tectonic",
        forwardSearchAfter = false,
        onSave = true
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        args = {}
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = false
      }
    }
  }
}
require('lspconfig').tsserver.setup{
  capabilities = capabilities
}
require('lspconfig').pyright.setup{
  capabilities = capabilities,
}
require('lspconfig').dockerls.setup{
  capabilities = capabilities
}
require('lspconfig').vimls.setup {
  capabilities = capabilities,
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  init_options = {
    diagnostic = {
      enable = true
    },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      runtimepath = true
    },
    iskeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = {
      fromRuntimepath = true,
      fromVimruntime = true
    },
    vimruntime = ""
  }
}

-- Setup builtin LspDiagnosticSigns
local signs = { Error = "🔥", Warning = "⚡", Hint = "💡", Information = "🏷️" }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Get the current working directory for neovim
local function cwd()
  return vim.loop.cwd()
end

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = "/usr/share/lua-language-server"
local sumneko_binary = "/usr/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('lspconfig').sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
require('lspconfig').gopls.setup{}
require('colorizer').setup()
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
require'lsp_signature'.setup()

-- Disable most built-in nvim lsp diagnostics settings
local function setup_diags()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      signs = false,
      update_in_insert = false,
      underline = false,
    }
  )
end
setup_diags()
EOF


""" REMAPS
" Make `Y` behave to copy trailing text
nnoremap Y y$

" Global LSP Remaps
nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>


" Stay centered when merging lines or going trough searches with n/N
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u

" Jumplist mutations
nnoremap <expr> k (v:count >5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count >5 ? "m'" . v:count : "") . 'j'

" Indenting
vnoremap < <gv
vnoremap > >gv

" GIT
nmap <leader>gg :G<CR>
nmap <leader>gp :G push<CR>
nmap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches({ prompt_prefix = " " })<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_stash({ prompt_prefix = "  " })<cr>
nnoremap <leader>ss <cmd>lua require('telescope.builtin').git_status({prompt_prefix="  " })<cr>

" Searching
nnoremap <leader>fG <cmd>lua require('telescope.builtin').live_grep({ prompt_prefix= "🚀 "})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ prompt_prefix= "📖 "})<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string({ prompt_prefix= ">>> ", search = vim.fn.input("Grep For > ")})<cr>
nnoremap <leader>hh  <cmd>lua require('telescope.builtin').command_history({ prompt_prefix = "  " })<cr>
nnoremap <leader>:  <cmd>lua require('telescope.builtin').commands({ prompt_prefix = "  " })<cr>
nnoremap <leader>sh <cmd>lua require('telescope.builtin').search_history({ prompt_prefix = "  " })<cr>

" Moving around
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers({prompt_prefix= "𧻓 "})<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ prompt_prefix= "🗃️ ", hidden = true })<cr>
nnoremap <leader>ft :Telescope file_browser<cr>
nnoremap <leader>oo  <cmd>lua require('telescope.builtin').oldfiles({ prompt_prefix = "  " })<cr>

" Help
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags({prompt_prefix= "🤔 "})<cr>
nnoremap <leader>fH <cmd>lua require('telescope.builtin').man_pages({prompt_prefix= "  "})<cr>
nnoremap <leader>lk <cmd>lua require('telescope.builtin').keymaps({ prompt_prefix = "  " })<cr>

" Lsp
nnoremap <leader>tt <cmd>lua require('telescope.builtin').treesitter({ prompt_prefix = "  " })<cr>
nnoremap <leader>Q <cmd>lua require('telescope.builtin').quickfix({prompt_prefix="📜 " })<cr>
nnoremap <leader>gr <cmd>lua require('telescope.builtin').lsp_references({prompt_prefix="🛠️ " })<cr>

" Zen mode using goyo
nmap <leader>z :Goyo<CR>

" Keep highlighting consistent on entering/leaving goyo
function! s:goyo_enter()
  set nolist
  set listchars=
  hi NonText ctermfg=241 guifg=#606060
  " ...
endfunction

function! s:goyo_leave()
  set listchars=tab:»\ ,trail:·,eol:↲
  hi SignColumn ctermbg=236 guibg=#313335
  hi NonText ctermfg=241 guifg=#606060
  " ...
  "
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

set listchars=tab:»\ ,trail:·,eol:↲

" Maximizer
nmap <leader>m :MaximizerToggle!<CR>

" Fix for netrw-gx
nnoremap <silent> gx :execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>

" Trouble
nnoremap <leader>t :TroubleToggle<CR>

" Easier naviagtion in nvim windows than cumborsome defaults.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Keybinds for drawing boxes in multiple languages
autocmd BufEnter * nmap ,mc !!boxes -d pound-cmt<CR>
autocmd BufEnter * vmap ,mc !boxes -d pound-cmt<CR>
autocmd BufEnter * nmap ,xc !!boxes -d pound-cmt -r<CR>
autocmd BufEnter * vmap ,xc !boxes -d pound-cmt -r<CR>
autocmd BufEnter *.html nmap ,mc !!boxes -d html-cmt<CR>
autocmd BufEnter *.html vmap ,mc !boxes -d html-cmt<CR>
autocmd BufEnter *.html nmap ,xc !!boxes -d html-cmt -r<CR>
autocmd BufEnter *.html vmap ,xc !boxes -d html-cmt -r<CR>
autocmd BufEnter *.[chly],*.[pc]c nmap ,mc !!boxes -d c-cmt<CR>
autocmd BufEnter *.[chly],*.[pc]c vmap ,mc !boxes -d c-cmt<CR>
autocmd BufEnter *.[chly],*.[pc]c nmap ,xc !!boxes -d c-cmt -r<CR>
autocmd BufEnter *.[chly],*.[pc]c vmap ,xc !boxes -d c-cmt -r<CR>
autocmd BufEnter *.C,*.cpp,*.java nmap ,mc !!boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.java vmap ,mc !boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.java nmap ,xc !!boxes -d java-cmt -r<CR>
autocmd BufEnter *.C,*.cpp,*.java vmap ,xc !boxes -d java-cmt -r<CR>
autocmd BufEnter .vimrc*,.exrc nmap ,mc !!boxes -d vim-cmt<CR>
autocmd BufEnter .vimrc*,.exrc vmap ,mc !boxes -d vim-cmt<CR>
autocmd BufEnter .vimrc*,.exrc nmap ,xc !!boxes -d vim-cmt -r<CR>
autocmd BufEnter .vimrc*,.exrc vmap ,xc !boxes -d vim-cmt -r<CR>

" Debugger remaps
nnoremap<leader>dd :call vimspector#Launch(v:true)<cr>
nnoremap<leader>de <cmd>VimspectorReset<cr>
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>
nmap <leader>dp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcp <Plug>VimspectorToggleBreakpoint

" Vista remap
nmap <leader>v :Vista<CR>

" Markdown configurations
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '${name}'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" Emoji shortcuts
ab :vim: 

