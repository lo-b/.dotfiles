local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.python3_host_prog = '/usr/bin/python'

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

cmd("syntax on")
cmd("filetype plugin on")
cmd("colorscheme darcula")
cmd("hi GitSignsAdd guibg=none guifg=#587B0C")
cmd("hi GitSignsChange guibg=none guifg=#0C7D9D")
cmd("hi GitSignsDelete guibg=none guifg=#95161B")
cmd("hi SignColumn guibg=none")
cmd("hi LineNr guibg=none")
cmd("hi TroubleIndent guibg=none")
cmd("hi TroubleFoldIcon guibg=none")
cmd("hi Normal guibg=none")
