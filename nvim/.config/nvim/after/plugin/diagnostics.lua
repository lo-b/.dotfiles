local sign_define = vim.fn.sign_define

sign_define(
  "DiagnosticSignError",
  { text = "🔥", texthl = "DiagnosticSignError" }
)
sign_define(
  "DiagnosticSignWarn",
  { text = "⚡", texthl = "DiagnosticSignWarn" }
)
sign_define(
  "DiagnosticSignInfo",
  { text = "💡", texthl = "DiagnosticSignInfo" }
)
sign_define(
  "DiagnosticSignHint",
  { text = "🤔", texthl = "DiagnosticSignHint" }
)
