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

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  -- FIX: replace with Client:exec_cmd
  vim.lsp.buf.execute_command(params)
end

-- Converts JSON schema files matching a pattern into JSONLS schema configuration objects
-- @param pattern: glob pattern to match schema files (e.g., "*.schema.json")
-- @return: array of schema objects for JSONLS setup, each with fileMatch and url keys
local function glob_json_schemas(pattern)
  local schemas = {}
  local files = vim.fn.glob(pattern, false, true)
  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r"):gsub("%.schema$", "")
    table.insert(schemas, {
      fileMatch = { name .. ".json" },
      url = "file://" .. vim.fn.fnamemodify(file, ":p")
    })
  end
  return schemas
end

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    "pyright", "ruff", "bashls", "lua_ls", "taplo", "ansiblels",
    "jsonls", "lemminx", "bicep"
  },
  automatic_enable = true,
})
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "standard",
        venvPath = ".venv"
      },
    },
  },
  -- ... other config
})
vim.lsp.config("jsonls", {
  capabilities = capabilities,
  -- NOTE: disable LSP provided formatting; use prettier thru conform instead
  init_options = { provideFormatter = false },
  settings = {
    json = {
      schemas = glob_json_schemas("*.schema.json"),
      validate = { enable = true },
    },
  },
})
vim.lsp.config("yamlls", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    if filename:match('[%.]?azure%-pipelines%.y[a]?ml$') or filename:match('%.github/workflow') then
      vim.cmd("LspStop yamlls")
    end
  end,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
        "**/*compose.yaml",
        ["kubernetes"] = "/*.k8s.yaml",
        ["https://taskfile.dev/schema.json"] = {
          "**/Taskfile.yml",
          "**/taskfiles/*.yml",
        }
      },
    },
  },
})
vim.lsp.config('gh_actions_ls', {
  capabilities = capabilities,
  -- INFO: Custom filetype is set for GitHub Actions files;
  -- prevents start of all `*.y[a]ml`-related LSP servers.
  filetypes = {
    "yaml.github"
  }
})
vim.lsp.config("bashls", {
  capabilities = capabilities,
  filetypes = { "sh", "zsh" },
})
vim.lsp.enable('gopls')
vim.lsp.config("ansiblels", {
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
})
vim.lsp.config("texlab", {
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
        args = { "--synctex-forward", "%l:1:%f", "%p" }
      },
    },
  },
})
vim.lsp.enable("texlab")

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

vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
          path ~= vim.fn.stdpath('config')
          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})
require("roslyn").setup {
  capabilities = capabilities,
}
vim.lsp.config("azure_pipelines_ls", {
  capabilities = capabilities,
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
})
-- FIX: Hover will not work for both lsp clients (htmx and templ) in a .templ file.
-- In particular, hover will only work for htmx LSP, hover over templ syntax will return nothing.
-- Probably because htmx lsp is used to 'hover' templ syntax. Using LSPs separately works as expected; i.e. issues
-- arise when using both together.
vim.lsp.config("templ", {
  capabilities = capabilities,
})
vim.lsp.config('htmx', {
  capabilities = capabilities,
  filetypes = {
    "templ"
  },
})
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.diagnostics = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
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
})
vim.lsp.config("eslint", {
  filetypes = {
    "javascript",
    "typescript",
  },
})
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
