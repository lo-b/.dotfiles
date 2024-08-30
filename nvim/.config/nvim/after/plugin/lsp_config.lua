local border = {
  { "╔", "FloatBorder" },
  { "═", "FloatBorder" },
  { "╗", "FloatBorder" },
  { "║", "FloatBorder" },
  { "╝", "FloatBorder" },
  { "═", "FloatBorder" },
  { "╚", "FloatBorder" },
  { "║", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
      "basedpyright", "ruff", "bashls", "lua_ls", "taplo", "ansiblels",
      "jsonls",
    },
})

-- TOML lsp
require("lspconfig").taplo.setup {}
require("lspconfig").jsonls.setup {
  capabilities = capabilities,
  -- NOTE: disable LSP provided formatting; use prettier thru conform instead
  init_options = { provideFormatter = false },
}
require("lspconfig").yamlls.setup {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "**/*compose.yaml",
        kubernetes = "/*.k8s.yaml",
      },
    },
  },
}
require("lspconfig").emmet_ls.setup {
  capabilities = capabilities,
  filetypes = {
    "html",
    "typescriptreact",
    "javascriptreact",
    "css",
    "less",
    "svelte",
  },
}
require("lspconfig").svelte.setup {
  capabilities = capabilities,
}
require("lspconfig").bashls.setup {
  capabilities = capabilities,
  filetypes = { "sh", "zsh" },
}
require("lspconfig").volar.setup {
  filetypes = {
    "vue",
  },
}
require("lspconfig").gopls.setup {
  capabilities = capabilities,
}
require("lspconfig").ansiblels.setup {
  filetypes = { "ansible", "yaml.ansible" },
  capabilities = capabilities,
  settings = {
    ansible = {
      validation = {
        lint = {
          -- NOTE: linting will be set up using nvim-lint
          enabled = false,
        }
      }
    }
  }
}
require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities,
}
require("lspconfig").tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "svelte",
  },
}
-- INFO: setup ruff linting using lspconfig to integrate code actions
require("lspconfig").ruff.setup {
  capabilities = capabilities,
  init_options = {
    settings = {
      logLevel = "warn",
    }
  }
}
require("lspconfig").dockerls.setup {
  capabilities = capabilities,
}
require("lspconfig").sqlls.setup {
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
}
require("lspconfig").texlab.setup {
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
}
require("lspconfig").vimls.setup {
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
}

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

require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      format = {
        -- disable builtin formatting
        enable = false,
      },
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
}
require("lspconfig").terraformls.setup {}
require("roslyn").setup {
  capabilities = capabilities,
}

-- setup pyright based on whether a venv is active or not
local basedpyright = require("lspconfig").basedpyright
local active_venv = vim.env.VIRTUAL_ENV

if active_venv == nil then
  basedpyright.setup{}
else
  basedpyright.setup {
    capabilities = capabilities,
    filetypes = { "python" },
    settings = {
      basedpyright = {
        analysis = {
          include = { "**/*.py" },
        },
      },
      python = {
        -- point to python path of activate venv
        pythonPath = vim.fs.joinpath(active_venv, "bin", "python"),
      },
    },
  }
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})

local set_ft_augroup = vim.api.nvim_create_augroup("SetEnvFileType", {})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.env*" },
  command = "set ft=config",
  group = set_ft_augroup,
})

_ = vim.cmd [[
  hi Conceal ctermfg=250 ctermbg=238 guifg=#BBBBBB guibg=#46484A
]]
