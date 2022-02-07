local g = vim.g

g.vimtex_format_enabled = 1
g.vimtex_compiler_method = "tectonic"
-- The quickfix window is never opened/closed automatically.
g.vimtex_quickfix_mode = 0
g.vimtex_view_method = "zathura"
g.vimtex_compiler_tectonic = {
 build_dir = "",
 options = {
   "--keep-logs",
   '--synctex',
 },
}
