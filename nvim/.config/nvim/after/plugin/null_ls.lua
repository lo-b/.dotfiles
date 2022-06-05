local has_null_ls, null_ls = pcall(require, "null-ls")
if not has_null_ls then
  return
end

local sources = {
  null_ls.builtins.completion.luasnip,
  null_ls.builtins.completion.spell,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.latexindent,
  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.google_java_format,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.black,
  null_ls.builtins.diagnostics.hadolint
}

require("null-ls").setup({
  sources = sources
})
