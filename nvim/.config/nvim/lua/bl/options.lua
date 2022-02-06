local opt = vim.opt
local cmd = vim.cmd

vim.g.mapleader = " "
opt.textwidth=79
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.hidden = true
opt.backup = false
opt.background = 'dark'
opt.smartindent = true
opt.relativenumber = true
opt.hlsearch = true
opt.number = true
opt.errorbells = false
opt.incsearch = true
opt.scrolloff = 8
opt.signcolumn = 'yes:3'
opt.colorcolumn="80"
cmd("syntax on")
cmd("filetype plugin on")
opt.clipboard:append('unnamedplus')
opt.wrap = false
opt.updatetime = 100
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.shortmess:append("c")
opt.mouse = "a"
opt.listchars = {tab = "» ", trail = "·", eol = "↲"}
opt.list = true
opt.termguicolors = true
opt.statusline:append("%{get(b:,'gitsigns_status','')}")
opt.grepprg = 'rg --vimgrep --hidden'
opt.grepformat:prepend('%f:%l:%c:%m')
