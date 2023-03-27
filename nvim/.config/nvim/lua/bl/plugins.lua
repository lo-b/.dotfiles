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
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
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
      require("octo").setup()
    end,
  },
  "pearofducks/ansible-vim",
  "untitled-ai/jupyter_ascending.vim",
  "lervag/vimtex",
  "liuchengxu/vista.vim",
  "mfussenegger/nvim-dap",
  "mfussenegger/nvim-dap-python",
  "mfussenegger/nvim-jdtls",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "nvim-telescope/telescope-dap.nvim",
  "junegunn/vim-easy-align",
  "tpope/vim-dadbod",
  "tpope/vim-characterize",
  "tpope/vim-fugitive",
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "tpope/vim-eunuch",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope-media-files.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "machakann/vim-highlightedyank",
  "neovim/nvim-lspconfig",
  {
    "j-hui/fidget.nvim",
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
  { "github/copilot.vim", lazy = true },
  "onsails/lspkind-nvim",
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  "hoob3rt/lualine.nvim",
  "tweekmonster/startuptime.vim",
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
  },
  {
    "norcalli/nvim-colorizer.lua", -- Colored color codes/names
    config = function()
      require("colorizer").setup()
    end,
  },
  "matze/vim-move",
  "RRethy/vim-illuminate", -- Illuminate other usages of word
  "glepnir/dashboard-nvim",
  "ryanoasis/vim-devicons",
  "folke/zen-mode.nvim",
  "szw/vim-maximizer",
  "kyazdani42/nvim-web-devicons", -- Devicons d by telescope
  "nvim-treesitter/playground",
  "jiangmiao/auto-pairs",
  "lambdalisue/suda.vim",
  { "akinsho/bufferline.nvim", version = "v2.*" },
  "akinsho/toggleterm.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  "rcarriga/cmp-dap",
  { "petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim" },
  { "heavenshell/vim-pydocstring", ft = "python", build = "make install" },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && yarn install",
  },
  { "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "lewis6991/gitsigns.nvim",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "mattn/emmet-vim",
  "wakatime/vim-wakatime",
}

local opts = {}

require("lazy").setup(plugins, opts)
