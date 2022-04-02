local g = vim.g

g.vimtex_format_enabled = 1
-- The quickfix window is never opened/closed automatically.
g.vimtex_quickfix_mode = 0
g.vimtex_view_method = "zathura"

-- Build tex files on file save.
_ = vim.cmd [[
  augroup CompileAfterSave
    au!
    au BufWritePost *.tex :VimtexCompile
  augroup end
]]
