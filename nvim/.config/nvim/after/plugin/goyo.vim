" Keep highlighting consistent on entering/leaving goyo
function! s:goyo_enter()
  set nolist
  set listchars=
  hi NonText ctermfg=241 guifg=#606060
endfunction

function! s:goyo_leave()
  set listchars=tab:»\ ,trail:·,eol:↲
  set colorcolumn=80
  hi SignColumn guibg=none
  hi LineNr guibg=none
  hi VertSplit guifg=#606060
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
