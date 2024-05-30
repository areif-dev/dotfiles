require "keybinds"
require "plugins"
require "languages_conf"

local set = vim.opt

set.completeopt = 'menu,menuone,noselect'
set.wrap = false 
vim.cmd [[
  syntax enable
  filetype plugin indent on
]]
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.autoindent = true
set.swapfile = false
set.number = true
set.colorcolumn = {'80'}
set.updatetime = 250
vim.cmd [[
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus = false})
]]

require("catppuccin").setup()
