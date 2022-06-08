local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.python3_host_prog = "/usr/bin/python"
g.copilot_node_command = "/home/bram/.nvm/versions/node/v16.15.1/bin/node"
g.material_style = "darker"
g.dashboard_default_executive = "telescope"
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
opt.shortmess:append "c"
opt.mouse = "a"
opt.listchars = { tab = "» ", trail = "·", eol = "↲" }
opt.list = true
opt.termguicolors = true
opt.statusline:append "%{get(b:,'gitsigns_status','')}"
opt.grepprg = "rg --vimgrep --hidden"
opt.grepformat:prepend "%f:%l:%c:%m"
opt.fillchars = { eob = " " }

cmd "syntax enable"
cmd "filetype plugin on"
cmd "colorscheme material"
cmd [[
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
]]
cmd [[
let g:dashboard_custom_header = [
\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣤⣤⣤⣤⣶⣦⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀',
\'⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠛⠉⠙⠛⠛⠛⠛⠻⢿⣿⣷⣤⡀⠀⠀⠀⠀',
\'⠀⠀⠀⠀⠀⠀⠀⣼⣿⠋⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠈⢻⣿⣿⡄⠀⠀⠀',
\'⠀⠀⠀⠀⠀⠀⣸⣿⡏⠀⠀⠀⣠⣶⣾⣿⣿⣿⠿⠿⠿⢿⣿⣿⣿⣄⠀⠀',
\'⠀⠀⠀⠀⠀⠀⣿⣿⠁⠀⠀⢰⣿⣿⣯⠁⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣷⡄',
\'⠀⣀⣤⣴⣶⣶⣿⡟⠀⠀⠀⢸⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷',
\'⢰⣿⡟⠋⠉⣹⣿⡇⠀⠀⠀⠘⣿⣿⣿⣿⣷⣦⣤⣤⣤⣶⣶⣶⣶⣿⣿⣿',
\'⢸⣿⡇⠀⠀⣿⣿⡇⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃',
\'⣸⣿⡇⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠉⠻⠿⣿⣿⣿⣿⡿⠿⠿⠛⢻⣿⡇⠀',
\'⠸⣿⣧⡀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠃⠀',
\'⠀⠛⢿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⣰⣿⣿⣷⣶⣶⣶⣶⠶⠀⢠⣿⣿⠀⠀',
\'⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⣿⣿⡇⠀⣽⣿⡏⠁⠀⠀⢸⣿⡇⠀⠀',
\'⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⣿⣿⡇⠀⢹⣿⡆⠀⠀⠀⣸⣿⠇⠀⠀',
\'⠀⠀⠀⠀⠀⠀⢿⣿⣦⣄⣀⣠⣴⣿⣿⠁⠀⠈⠻⣿⣿⣿⣿⡿⠏⠀⠀⠀',
\'⠀⠀⠀⠀⠀⠀⠈⠛⠻⠿⠿⠿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\]
]]
