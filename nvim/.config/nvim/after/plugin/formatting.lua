local has_conform, conform = pcall(require, "conform")
if not has_conform then
  return
end

conform.formatters.sql_formatter = {
  command = "/home/bram/.local/share/nvim/mason/bin/sql-formatter",
}

conform.setup({
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { c = true, cpp = true }
    return {
      timeout_ms = 500,
      lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    }
  end,
  formatters_by_ft = {
    python = { "ruff_format", "ruff_organize_imports" },
    json = { "prettier" },
    markdown = { "prettier" },
    sql = { "sql_formatter" },
    javascript = { "prettier" },
  },
})
