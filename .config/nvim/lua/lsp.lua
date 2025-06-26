local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

if vim.fn.executable("vscode-html-language-server") == 1 then 
  lspconfig.html.setup {
    capabilities = capabilities
  }
end

if vim.fn.executable("vscode-css-language-server") == 1 then 
  lspconfig.cssls.setup {
    capabilities = capabilities
  }
end

if vim.fn.executable("rust-analyzer") == 1 then
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities
  })
end

if vim.fn.executable("typescript-language-server") == 1 then 
  lspconfig.ts_ls.setup({
    capabilities = capabilities,
  })
end

if vim.fn.executable("pyright") == 1 then 
  lspconfig.pyright.setup({
    capabilities = capabilities,
  })
end

if vim.fn.executable("gopls") == 1 then 
  lspconfig.gopls.setup({
    capabilities = capabilities,
  })
end
