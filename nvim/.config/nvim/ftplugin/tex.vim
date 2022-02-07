augroup CompileAfterSave
  au!
  au BufWritePost *.tex call vimtex#compiler#start()
augroup end
