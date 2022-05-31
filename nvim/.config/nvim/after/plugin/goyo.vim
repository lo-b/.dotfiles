" Keep highlighting consistent on entering/leaving goyo
function! s:goyo_enter()
  set nolist
  set listchars=
  hi NonText ctermfg=241 guifg=#606060
  " ...
endfunction

function! s:goyo_leave()
  set listchars=tab:»\ ,trail:·,eol:↲
  set colorcolumn=80
  hi SignColumn ctermbg=236 guibg=#313335
  hi ColorColumn ctermbg=236 guibg=#2F2F2F
  hi NonText ctermfg=241 guifg=#606060
  " ...
  "
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
