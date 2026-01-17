local has_ts, ts = pcall(require, "nvim-treesitter")
if not has_ts then
  return
end

local parsers = { "go", "templ", "html", "css", "js" }
ts.install()

vim.api.nvim_create_autocmd('FileType', {
  pattern = parsers,
  callback = function()
    vim.treesitter.start()
  end,
})
