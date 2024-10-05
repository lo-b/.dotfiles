local has_dap, dap = pcall(require, "dap")
if not has_dap then
  return
end

vim.fn.sign_define(
  "DapBreakpoint",
  { text = "🐞", texthl = "Error", linehl = "", numhl = "" }
)
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "C", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
  "DapLogPoint",
  { text = "L", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
  "DapStopped",
  { text = "🤚", texthl = "", linehl = "", numhl = "" }
)

require("nvim-dap-virtual-text").setup {
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
  only_first_definition = true,
  all_references = false,
  filter_references_pattern = "<module",
  -- experimental features:
  virt_text_pos = "eol",
  all_frames = false,
  virt_lines = false,
  virt_text_win_col = nil,
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "my python launch",
    program = "${file}",
    args = { "--target", "api" },
    console = "integratedTerminal",
  },
}

local dap_python = require "dap-python"
dap_python.setup("/usr/bin/python", {
  console = "externalTerminal",
  include_configs = true,
})

dap.adapters.coreclr = {
  type = "executable",
  command = "/usr/bin/netcoredbg",
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

require("dapui").setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has "nvim-0.7",
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
}

local map = vim.keymap.set
local options = { silent = true }

map("n", "<leader>d<leader>", require("dap").continue, options)
map("n", "<leader>dj", require("dap").step_over, options)
map("n", "<leader>dl", require("dap").step_into, options)
map("n", "<leader>dk", require("dap").step_out, options)
map("n", "<leader>dp", require("dap").toggle_breakpoint, options)
map("n", "<leader>dcp", function()
  require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ")
end, options)
map("n", "<leader>dr", require("dap").repl.open, options)
map("n", "<leader>d_", require("dap").run_last, options)
map("n", "<leader>dm", require("dap-python").test_method, options)
map("n", "<leader>dc", require("dap-python").test_class, options)
map("n", "<leader>ds", require("dap-python").debug_selection, options)

local dapui = require "dapui"
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
