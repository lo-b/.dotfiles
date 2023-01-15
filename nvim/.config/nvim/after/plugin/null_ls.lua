local has_null_ls, null_ls = pcall(require, "null-ls")
if not has_null_ls then
  return
end

-- Prevent multiple formatting options and select single server to format to
local util = require "vim.lsp.util"

local formatting_callback = function(client, bufnr)
  vim.keymap.set("n", "<leader>F", function()
    local params = util.make_formatting_params {}
    client.request("textDocument/formatting", params, nil, bufnr)
  end, { buffer = bufnr })
end

local lsp_formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local set_ft_augroup = vim.api.nvim_create_augroup("SetEnvFileType", {})
local sources = {
  null_ls.builtins.code_actions.shellcheck.with {
    filetypes = { "sh", "zsh" },
  },
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.completion.luasnip,
  null_ls.builtins.completion.spell,
  null_ls.builtins.formatting.stylua.with {
    extra_args = { "--config-path", "/home/bram/.config/stylua/stylua.toml" },
  },
  null_ls.builtins.formatting.latexindent,
  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.google_java_format,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.shfmt.with {
    filetypes = { "sh", "zsh" },
    extra_args = { "-i", "2", "-ci", "-bn" },
  },
  null_ls.builtins.formatting.prettier.with {
    extra_filetypes = { "svelte" },
  },
  null_ls.builtins.diagnostics.hadolint,
  null_ls.builtins.diagnostics.vint,
}

-- Enable format on save
require("null-ls").setup {
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = lsp_formatting_augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = lsp_formatting_augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format()
        end,
      })
    end
  end,
  sources = sources,
}

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.env*" },
  command = "set ft=config", -- Or myvimfun
  group = set_ft_augroup,
})
