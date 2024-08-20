local has_lint, lint = pcall(require, "lint")
if not has_lint then
  return
end

lint.linters_by_ft = {
  python = { "mypy" }
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
  desc = "nvim-lint autogroup",
})
