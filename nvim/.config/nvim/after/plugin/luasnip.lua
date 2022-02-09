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
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.snippets = {
    all = {},

    lua = {
      s("req", fmt("local {} = require('{}')", { i(1, "my_mod"), rep(1) }))
    },

    tex = {
      s("begin", fmta([[
      \begin{<>}
        <>
      \end{<>}
      ]], { i(1), i(2), rep(1) })),

      s("sec", fmta([[
      \section{<>}
      ]], i(1))),

      s("!doc", fmta([[
      \documentclass{article}

      \usepackage[utf8]{inputenc}
      \usepackage{geometry}
       \geometry{
       a4paper,
       total={170mm,257mm},
       left=20mm,
       top=20mm,
       }

      % \usepackage[backend=biber]{biblatex}
      % \addbibresource{../sources.bib}

      % \usepackage{graphicx}
      % \graphicspath{ {../assets/} }

      % \usepackage{caption}
      % \usepackage{subcaption}
      % \usepackage{subfiles} % Best loaded last in the preamble

      \title{<>}
      \author{Bram Lo}

      \begin{document}

      \begin{titlepage}
      \maketitle
      \end{titlepage}

      \tableofcontents
      \newpage

      <>

      \end{document}
      ]], { i(1), i(2) })),

      s("!sf", fmta([[
      \documentclass[../<>.tex]{subfiles}
      \graphicspath{{\subfix{../<>/}}}
      \begin{document}

      <>

      \end{document}
      ]], {i(1), i(2, "assets"), i(3)})),

      s("mfig", fmta([[
      \begin{figure}
           \centering
           \begin{subfigure}[b]{0.4\textwidth}
               \centering
               \includegraphics[width=\textwidth]{<>}
               \caption{<>}
               \label{fig:<>}
           \end{subfigure}
           \hfill
           \begin{subfigure}[b]{0.4\textwidth}
               \centering
               \includegraphics[width=\textwidth]{<>}
               \caption{<>}
               \label{fig:<>}
           \end{subfigure}
              \caption{<>}
              \label{fig:<>}
      \end{figure}
      ]], { i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8), })),
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
