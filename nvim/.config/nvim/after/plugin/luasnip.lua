local ls = require "luasnip"

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you
  -- type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,
}

local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.snippets = {
    all = {},

    lua = {
      s("req", fmt("local {} = require('{}')", { i(1, "my_mod"), rep(1) }))
    }
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- Shorcut to source luasnips file; reloads snippets.
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
