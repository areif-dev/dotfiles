local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.lsp.config("*", {
	capabilities = capabilities,
})

if vim.fn.executable("vscode-html-language-server") == 1 then 
  vim.lsp.enable("html")
end

if vim.fn.executable("vscode-css-language-server") == 1 then 
  vim.lsp.enable("cssls")
end

if vim.fn.executable("rust-analyzer") == 1 then
  vim.lsp.enable("rust_analyzer")
end

if vim.fn.executable("typescript-language-server") == 1 then 
  vim.lsp.enable("ts_ls")
end

if vim.fn.executable("pyright") == 1 then 
  vim.lsp.enable("pyright")
end

if vim.fn.executable("gopls") == 1 then 
  vim.lsp.enable("gopls")
end
