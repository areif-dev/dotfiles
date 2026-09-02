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
      vim.g.catppuccin_flavour = "mocha"
      vim.cmd([[colorscheme catppuccin]])
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = {"rust"},
  },
  {
    "neovim/nvim-lspconfig",
    config = function() 
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args) 
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client.supports_method("textDocument/formatting") then 
            vim.api.nvim_create_autocmd("BufWritePre", {
              callback = function() 
                vim.lsp.buf.format({})
              end,
            })
          end
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer", -- source for text in buffer 
      "hrsh7th/cmp-path", -- source for file system paths in commands 
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      local template_filetypes = {
        "htmldjango",
        "django",
        "jinja",
        "jinja2",
        "handlebars",
        "hbs",
        "mustache",
        "liquid",
        "blade",
        "eruby",
        "gotmpl",
        "gohtml",
        "gohtmltmpl",
        "php",
      }
      for _, ft in ipairs(template_filetypes) do
        luasnip.filetype_extend(ft, { "html" })
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) 
          end,
        },
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
        htmldjango = { "djlint" },
        django = { "djlint" },
        jinja = { "djlint" },
        jinja2 = { "djlint" },
        handlebars = { "djlint" },
        hbs = { "djlint" },
        mustache = { "djlint" },
        gotmpl = { "djlint" },
        gohtml = { "djlint" },
        gohtmltmpl = { "djlint" },
        liquid = { "prettier" },
        blade = { "prettier" },
        eruby = { "prettier" },
        php = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
      formatters = {
        djlint = {
          prepend_args = {
            "--configuration",
            vim.fn.expand("~/.config/djlint/.djlintrc"),
          },
        },
        prettier = {
          options = {
            ft_parsers = {
              liquid = "html",
              blade = "html",
              eruby = "html",
              php = "html",
            },
          },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
        aliases = {
          ["htmldjango"] = "html",
          ["django"] = "html",
          ["jinja"] = "html",
          ["jinja2"] = "html",
          ["handlebars"] = "html",
          ["hbs"] = "html",
          ["mustache"] = "html",
          ["liquid"] = "html",
          ["blade"] = "html",
          ["eruby"] = "html",
          ["gotmpl"] = "html",
          ["gohtml"] = "html",
          ["gohtmltmpl"] = "html",
          ["php"] = "html",
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "css", "rust", "python", "go", "gomod", "gowork", "htmldjango" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}

require("lazy").setup(packages)
