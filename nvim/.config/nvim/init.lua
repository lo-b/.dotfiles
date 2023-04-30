-- Leader key -> "<Space>"
--
-- Setting leader mapping early; mappings set before setting this option will
-- have the old leader key.
vim.g.mapleader = " "

require "bl.options"
require "bl.plugins"
require "bl.maps"
