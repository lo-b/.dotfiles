" To get info about settings use `:h <option>`.
lua require("bl.options")

let g:highlightedyank_highlight_duration = 500

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


""" REMAPS
lua require("bl.maps")

" Jumplist mutations
nnoremap <expr> k (v:count >5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count >5 ? "m'" . v:count : "") . 'j'

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
