local g = vim.g
local execute = vim.api.nvim_command

g.ale_completion_enabled = 0
g.ale_fixers = {
  javascript = {"eslint"},
  typescript = {"eslint", "prettier"},
  tex = {"FormatTex"},
  go = {"gofmt"},
}

g.ale_linters = {
  tex = {"vale", "texlab"},
}

-- Sign settings
g.ale_sign_priority = 90
g.ale_sign_error = "🔥"
g.ale_sign_info = "💡"
g.ale_sign_warning = "⚡"
g.ale_floating_window_border = {"│", "─", "╭", "╮", "╯", "╰"}

-- Hover settings
g.ale_floating_preview = 1
g.ale_set_balloons = 1

-- Linting settings
g.ale_fix_on_save = 1
g.ale_lint_on_save = 1


-- Python formatter
g.pydocstring_formatter = "google"
