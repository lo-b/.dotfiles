-- Setup nvim-cmp.
local lspkind = require "lspkind"
local cmp = require "cmp"

cmp.setup {
  -- nvim-cmp by defaults disables autocomplete for prompt buffers
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
      or require("cmp_dap").is_dap_buffer()
  end,
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  formatting = {
    format = lspkind.cmp_format {
      mode = "symbol_text",
      maxwidth = 50,
      before = function(entry, vim_item)
        -- ...
        return vim_item
      end,
    },
  },
  mapping = {
    ["<c-n>"] = cmp.mapping.select_next_item(),
    ["<c-p>"] = cmp.mapping.select_prev_item(),
    ["<c-d>"] = cmp.mapping.scroll_docs(-4),
    ["<c-f>"] = cmp.mapping.scroll_docs(4),
    ["<c-space>"] = cmp.mapping.complete(),
    ["<c-e>"] = cmp.mapping.close(),
    ["<c-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- For luasnip users.
    { name = "path" },
    { name = "buffer" },
    { name = "dap" },
    { name = "git" },
  },
}

-- Setup for vim-dadbod
cmp.setup.filetype( { "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" }
  }
})

require("cmp_git").setup()

-- VSCode-like menu colors
_ = vim.cmd [[
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
]]
