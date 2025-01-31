require "keybinds"
require "plugins"
require "languages_conf"
require "lsp"

local set = vim.opt

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
vim.cmd [[
  au BufRead,BufNewFile *.bu set filetype=yaml
]]

require("catppuccin").setup()
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup {
  capabilities = capabilities
}
