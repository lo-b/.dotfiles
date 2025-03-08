require('render-markdown').setup({
  enabled = false,
})

local hover_winid = nil -- Store the active hover window ID

local function on_hover(err, result, ctx, config)
  if err or not result or not result.contents then return end

  -- If a hover window already exists, focus it instead of creating a new one
  if hover_winid and vim.api.nvim_win_is_valid(hover_winid) then
    vim.api.nvim_set_current_win(hover_winid)
    return
  end

  -- Use the default LSP hover handler to open the floating window
  local bufnr, winid = vim.lsp.util.open_floating_preview(
    vim.lsp.util.convert_input_to_markdown_lines(result.contents),
    "markdown",
    config
  )

  -- Store the window ID for reuse
  if winid and vim.api.nvim_win_is_valid(winid) then
    hover_winid = winid
    vim.cmd("RenderMarkdown") -- Run the plugin as soon as the hover window appears

    -- Close the window when it loses focus
    vim.api.nvim_create_autocmd("WinClosed", {
      pattern = tostring(winid),
      callback = function()
        hover_winid = nil
      end,
    })
  end
end

-- Set this as the default hover handler for all LSPs
vim.lsp.handlers["textDocument/hover"] = on_hover
