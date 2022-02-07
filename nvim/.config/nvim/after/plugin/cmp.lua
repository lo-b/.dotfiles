-- Setup nvim-cmp.
local lspkind = require "lspkind"
local cmp = require "cmp"
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        path = "[path]",
        ultisnips = "[snip]",
      },
    },
  },
  mapping = {
    ["<c-d>"] = cmp.mapping.scroll_docs(-4),
    ["<c-f>"] = cmp.mapping.scroll_docs(4),
    ["<c-space>"] = cmp.mapping.complete(),
    ["<c-e>"] = cmp.mapping.close(),
    ["<c-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "ultisnips" }, -- For ultisnips users.
    { name = "buffer" },
    { name = "path" },
  },
  experimental = {
    native_menu = false,

    ghost_text = true,
  }
})
