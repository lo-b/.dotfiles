local opt = vim.opt
local g = vim.g

opt.pumblend = 10
opt.wildmode = "longest:full"
opt.wildoptions = "pum"
opt.textwidth = 79
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.hidden = true
opt.backup = false
opt.background = "dark"
opt.smartindent = true
opt.relativenumber = true
opt.hlsearch = true
opt.number = true
opt.errorbells = false
opt.incsearch = true
opt.scrolloff = 8
opt.signcolumn = "yes:3"
opt.colorcolumn = "80"
opt.clipboard:append "unnamedplus"
opt.wrap = false
opt.updatetime = 100
opt.completeopt = { "menuone", "noinsert", "noselect" }
opt.shortmess:append "cI"
opt.mouse = "a"
opt.listchars = { tab = "» ", trail = "·", eol = "↲" }
opt.list = true
opt.termguicolors = true
opt.statusline:append "%{get(b:,'gitsigns_status','')}"
opt.grepprg = "rg --vimgrep --hidden"
opt.grepformat:prepend "%f:%l:%c:%m"
opt.fillchars = { eob = " ", diff = "╱" }

-- disable builtin file explorer netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.copilot_node_command = "/home/bram/.nvm/versions/node/v16.15.1/bin/node"
g.material_style = "darker"
g.highlightedyank_highlight_duration = 500
g.python3_host_prog="/usr/bin/python"

vim.cmd [[
  syntax enable
  filetype plugin on
]]
