local g = vim.g

g.vimtex_format_enabled = 1
-- The quickfix window is never opened/closed automatically.
g.vimtex_quickfix_mode = 0
g.vimtex_view_method = "zathura"
local disable_copilot = "Copilot disable"

-- Disable diagnostics and github copilot when editing .tex files.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.tex" },
  callback = function()
    vim.diagnostic.disable()
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.tex" },
  command = disable_copilot, -- Or myvimfun
})
