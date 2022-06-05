-- Only required if you have packer configured as `opt`
_ = vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }
  use {
    "ray-x/lsp_signature.nvim",
    opt = true,
    config = function() require("lsp_signature").setup() end
  }
  use "pearofducks/ansible-vim"
  use "untitled-ai/jupyter_ascending.vim"
  use "lervag/vimtex"
  use "liuchengxu/vista.vim"
  use "metakirby5/codi.vim"
  use "mfussenegger/nvim-dap"
  use "mfussenegger/nvim-dap-python"
  use "mfussenegger/nvim-jdtls"
  use "rcarriga/cmp-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"
  use "vimwiki/vimwiki"
  use "junegunn/vim-easy-align"
  use "doums/darcula"
  use "tpope/vim-dadbod"
  use "tpope/vim-characterize"
  use "tpope/vim-fugitive"
  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "tpope/vim-eunuch"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "machakann/vim-highlightedyank"
  use "neovim/nvim-lspconfig"
  use "onsails/lspkind-nvim"
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
  }
  use "hoob3rt/lualine.nvim"
  use "tweekmonster/startuptime.vim"
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      }
  }
  use {
    "norcalli/nvim-colorizer.lua", -- Colored color codes/names
    config = function() require("colorizer").setup() end
  }
  use "matze/vim-move"
  use "RRethy/vim-illuminate" -- Illuminate other usages of word
  use "mhinz/vim-startify"
  use "ryanoasis/vim-devicons"
  use "junegunn/goyo.vim"
  use "szw/vim-maximizer"
  use "kyazdani42/nvim-web-devicons" -- Devicons used by telescope
  use "nvim-treesitter/playground"
  use "jiangmiao/auto-pairs"
  use "lambdalisue/suda.vim"
  use { "akinsho/bufferline.nvim", branch = "main" }
  use "akinsho/toggleterm.nvim"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use { "heavenshell/vim-pydocstring", ft = "python", run = "make install" }
  use { "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install" }
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use "lewis6991/gitsigns.nvim"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
end)
