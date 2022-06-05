-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Prevent multiple formatting options and select single server to format to
local util = require("vim.lsp.util")
local formatting_callback = function(client, bufnr)
  vim.keymap.set("n", "<leader>F", function()
    local params = util.make_formatting_params({})
    client.request("textDocument/formatting", params, nil, bufnr)
  end, { buffer = bufnr })
end

require("lspconfig").volar.setup({
  filetypes = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "json",
  },
})
require("lspconfig").tailwindcss.setup({
  capabilities = capabilities,
})
require("lspconfig").gopls.setup({
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
  end,
  capabilities = capabilities,
})
require("lspconfig").ansiblels.setup({
  filetypes = {"yaml.ansible", "yaml"},
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
  end,
  capabilities = capabilities,
})
require("lspconfig").rust_analyzer.setup({
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
  end,
  capabilities = capabilities,
})
require("lspconfig").tsserver.setup({
  capabilities = capabilities,
})
require("lspconfig").pyright.setup({
  -- using `formatting_callback` does not work here, set keymap below instead
  on_attach = function(client, bufnr)
    vim.keymap.set('n', '<space>F', vim.lsp.buf.formatting, { noremap = true, silent = true, buffer = bufnr })
  end,
  capabilities = capabilities,
})
require("lspconfig").dockerls.setup({
  capabilities = capabilities,
})
require("lspconfig").sqls.setup({
  settings = {
    sqls = {
      connections = {
        {
          alias = "Shopping database",
          driver = "sqlite3",
          dataSourceName = "/home/bram/dbs/sqlite/student-data.db",
        },
      },
    },
  },
})
require("lspconfig").texlab.setup({
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
  end,
  capabilities = capabilities,
  cmd = { "texlab" },
  filetypes = { "tex", "bib" },
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        executable = "latexmk",
        forwardSearchAfter = false,
        onSave = true,
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false,
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        args = {},
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = false,
      },
    },
  },
})
require("lspconfig").vimls.setup({
  capabilities = capabilities,
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  init_options = {
    diagnostic = {
      enable = true,
    },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = {
        "runtime",
        "nvim",
        ".git",
        "autoload",
        "plugin",
      },
      runtimepath = true,
    },
    iskeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = {
      fromRuntimepath = true,
      fromVimruntime = true,
    },
    vimruntime = "",
  },
})

-- viml setting
vim.g.markdown_fenced_languages = {
  "vim",
  "help",
}

-- Setup builtin LspDiagnosticSigns (used by trouble)
local signs = {
  Error = "🔥",
  Warning = "⚡",
  Hint = "💡",
  Information = "🤨",
}

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
  end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Prevent lua-language-server from prompting to configure working environment.
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = capabilities,
})

_ = vim.cmd([[
  hi Conceal ctermfg=250 ctermbg=238 guifg=#BBBBBB guibg=#46484A
]])
