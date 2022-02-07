
" Custom latex formatter using latexindent docker image
function! FormatTex(buffer)
  silent execute '!latexindent /app/%'
  silent execute ':e'
endfunction

execute ale#fix#registry#Add('texfmt', 'FormatTex', ['tex'], 'texfmt for tex')


" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


" Darcula theme settings for ALE
hi! link ALEError Error
hi! link ALEWarning CodeWarning
hi! link ALEInfo CodeInfo
hi! link ALEErrorSign ErrorSign
hi! link ALEWarningSign WarningSign
hi! link ALEInfoSign InfoSign
