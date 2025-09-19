local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "marko-cerovac/material.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd [[colorscheme material]]
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup {
        default_to_projects_v2 = true,
      }
    end,
  },
  "pearofducks/ansible-vim",
  "untitled-ai/jupyter_ascending.vim",
  "liuchengxu/vista.vim",
  "mfussenegger/nvim-dap",
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
  },
  "mfussenegger/nvim-dap-python",
  "mfussenegger/nvim-jdtls",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  {
    "leoluz/nvim-dap-go",
    config = function()
      require('dap-go').setup()
    end,
  },
  "junegunn/vim-easy-align",
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-completion",
  "kristijanhusak/vim-dadbod-ui",
  "tpope/vim-characterize",
  "tpope/vim-fugitive",
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "tpope/vim-eunuch",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-dap.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope-media-files.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "machakann/vim-highlightedyank",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- LSP servers and clients communicate which features they support through "capabilities".
  --  By default, Neovim supports a subset of the LSP specification.
  --  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
  --  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
  --
  -- This can vary by config, but in general for nvim-lspconfig:
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup {
        text = {
          spinner = "dots", -- animation shown when tasks are ongoing
          done = "✔", -- character shown when all tasks are complete
          commenced = "Started", -- message shown when task starts
          completed = "Completed", -- message shown when task completes
        },
      }
    end,
  },
  { "github/copilot.vim",          lazy = true },
  "onsails/lspkind-nvim",
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" }
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  "hoob3rt/lualine.nvim",
  {
    "norcalli/nvim-colorizer.lua", -- Colored color codes/names
    lazy = true,
    config = function()
      require("colorizer").setup()
    end,
  },
  "matze/vim-move",
  "RRethy/vim-illuminate", -- Illuminate other usages of word
  "ryanoasis/vim-devicons",
  "folke/zen-mode.nvim",
  "szw/vim-maximizer",
  "kyazdani42/nvim-web-devicons", -- Devicons d by telescope
  "nvim-treesitter/playground",
  "jiangmiao/auto-pairs",
  "lambdalisue/suda.vim",
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = 'default' },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { "sources.default" }
  },
  { "heavenshell/vim-pydocstring", ft = "python", build = "make install" },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  { "folke/trouble.nvim",                     dependencies = "kyazdani42/nvim-web-devicons" },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false }
  },
  { "nvim-treesitter/nvim-treesitter",        build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-context" },
  "lewis6991/gitsigns.nvim",
  "L3MON4D3/LuaSnip",
  "nvim-neotest/nvim-nio",
  -- "mattn/emmet-vim",
  "evanleck/vim-svelte",
  "hashivim/vim-terraform",
  "sindrets/diffview.nvim",
  {
    "seblj/roslyn.nvim",
    ft = "cs",
  },
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  "rest-nvim/rest.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "nanotee/sqls.nvim",
  { 'wakatime/vim-wakatime', lazy = false }
}

local opts = {}

require("lazy").setup(plugins, opts)
