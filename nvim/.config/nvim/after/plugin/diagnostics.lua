local sign_define = vim.fn.sign_define

vim.diagnostic.config {
  -- options for floating windows:
  float = {
    show_header = true,
    -- border = "rounded",
    -- source = "always",
    format = function(d)
      local t = vim.deepcopy(d)
      local code = d.code or d.user_data.lsp.code
      if code then
        t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
      end
      return t.message
    end,
  },

  update_in_insert = false,
  severity_sort = true,
}

-- Create a custom namespace. This will aggregate signs from all other
-- namespaces and only show the one with the highest severity on a
-- given line
local ns = vim.api.nvim_create_namespace "filter_diagnostics_signs"

-- Get a reference to the original signs handler
local orig_signs_handler = vim.diagnostic.handlers.signs

vim.diagnostic.handlers.signs = {
  show = function(_, bufnr, _, opts)
    -- Get all diagnostics from the whole buffer rather than just the
    -- diagnostics passed to the handler
    local diagnostics = vim.diagnostic.get(bufnr)

    -- Find the "worst" diagnostic per line
    local max_severity_per_line = {}
    for _, d in pairs(diagnostics) do
      local m = max_severity_per_line[d.lnum]
      if not m or d.severity < m.severity then
        max_severity_per_line[d.lnum] = d
      end
    end

    -- Pass the filtered diagnostics (with our custom namespace) to
    -- the original handler
    local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
    orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
  end,
  hide = function(_, bufnr)
    orig_signs_handler.hide(ns, bufnr)
  end,
}

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
