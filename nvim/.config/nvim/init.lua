-- Leader key -> "<Space>"
--
-- Setting leader mapping early; mappings set before setting this option will
-- have the old leader key.
vim.g.mapleader = " "

require "bl.options"
require "bl.plugins"
require "bl.maps"

-- Function to get all active buffers, used by nvr to (remotely) get all active
-- buffers of a nvim instance.
-- vim.cmd [[
-- function! GetActiveBuffers()
--     let l:blist = getbufinfo({'bufloaded': 1, 'buflisted': 1})
--     let l:result = []
--     for l:item in l:blist
--         call add(l:result, shellescape(l:item.name))
--     endfor
--     return l:result
-- endfunction
-- ]]
