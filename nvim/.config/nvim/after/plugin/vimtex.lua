local g = vim.g

g.vimtex_format_enabled = 1
-- The quickfix window is never opened/closed automatically.
g.vimtex_quickfix_mode = 0
g.vimtex_view_method = "zathura"

-- Disable diagnostics when editing .tex files. Diagnostics aren't that useful
-- when writing latex and it causes a lot of distracting warnings -- even when
-- tex compiles perfectly.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.tex" },
  callback = function()
    vim.diagnostic.disable()
  end,
})
