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
local capabilities = require('blink.cmp').get_lsp_capabilities()

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
      "basedpyright", "ruff", "bashls", "lua_ls", "taplo", "ansiblels",
      "jsonls", "lemminx", "bicep"
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
  -- disable yamlls for Azure (DevOps) Pipeline files
  on_attach = function(client, bufnr)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    if filename:match('[%.]?azure%-pipelines%.y[a]?ml$') or filename:match('%.github/workflow') then
      vim.cmd("LspStop yamlls")
    end
  end,
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
require'lspconfig'.gh_actions_ls.setup{}
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
require("lspconfig").sqls.setup{
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'sqlite3',
          dataSourceName = '/home/bram/db/peacefulares/peacefulares.sqlite3',
        },
      },
    },
  },
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
-- Setup LaTeX LSP
require("lspconfig").texlab.setup{
  settings = {
    texlab = {
      bibtexFormatter = "texlab",
      build = {
        executable = "tectonic",
        args = {
          "-X",
          "build"
        },
        onSave = true, -- Automatically build on save
      },
      forwardSearch = {
        executable = "zathura",
        args = {"--synctex-forward", "%l:1:%f", "%p"}
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
require("lspconfig").lemminx.setup {}
require("lspconfig").bicep.setup {}
require("lspconfig").azure_pipelines_ls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
          "/azure-pipeline*.y*l",
          "/*.azure*",
          "Azure-Pipelines/**/*.y*l",
          "Pipelines/*.y*l",
        },
      },
    },
  },
}
require("lspconfig").templ.setup{}
require("lspconfig").htmx.setup{}
require("lspconfig").ts_ls.setup{
  filetypes = {
    "javascript",
    "typescript",
  },
  settings = {
    javascript = {
      format = { enable = false },
    },
    typescript = {
      format = { enable = false },
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
require("lspconfig").eslint.setup{
  filetypes = {
    "javascript",
    "typescript",
  },
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
