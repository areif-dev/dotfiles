local map = function(mode, lhs, rhs) 
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = false })
end

local keybinds = {
  i = {
    {"<C-s>", "<ESC>:w<CR>"},
    {"<C-t>", "<ESC>:tabnew<CR>"},
    {"<C-w>", "<ESC>:q<CR>"},
  },
  n = {
    {"<C-l>", ":wincmd l<CR>"},
    {"<C-h>", ":wincmd h<CR>"},
    {"<C-j>", ":wincmd j<CR>"},
    {"<C-k>", ":wincmd k<CR>"},
    {"<C-w>", ":q<CR>"},
    {"<C-s>", ":w<CR>"},
    {"<C-f>", ":Neotree toggle<CR>"},
    {"<C-t>", ":tabnew<CR>"},
    {"(", ":tabNext<CR>"},
    {")", ":tabnext<CR>"},
    {"<C-e>", ":sp<CR>:wincmd j<CR>:term<CR>A"},
  },
  t = {
    {"<ESC>", "<C-\\><C-n>"},
    {"<C-w>", "<C-\\><C-n>:q<CR>"},
    {"<C-e>", "<C-\\><C-n>:q<CR>"},
  }
}

for mode, mode_list in pairs(keybinds) do
  for i, bind in pairs(mode_list) do 
    map(mode, bind[1], bind[2])
  end
end
