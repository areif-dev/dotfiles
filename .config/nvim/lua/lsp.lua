local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

if vim.fn.executable("rust-analyzer") == 1 then
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities
  })
else
  print("rust-analyzer not found")
end

if vim.fn.executable("pyright") == 1 then 
  lspconfig.pyright.setup({
    capabilities = capabilities
  })
else 
  print("pyright not found")
end
