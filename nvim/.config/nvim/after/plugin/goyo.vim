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
