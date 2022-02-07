" To get info about settings use `:h <option>`.
lua require("bl.options")
lua require("bl.plugins")
lua require("bl.maps")

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

let &t_ut=''

" Jumplist mutations
nnoremap <expr> k (v:count >5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count >5 ? "m'" . v:count : "") . 'j'
