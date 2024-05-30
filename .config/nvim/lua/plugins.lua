local install_lazy = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

install_lazy()

local packages = {
  {
    "catppuccin/nvim", 
    name = "catppuccin",
    lazy = false, 
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
      vim.g.catppuccin_flavour = "mocha"
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = {"rust"},
  },

  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      local coc_extns = require("coc_extns")
      coc_extns.sync_extensions()
    end
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup()
    end,
  },
}

require("lazy").setup(packages)
