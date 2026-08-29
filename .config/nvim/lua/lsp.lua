local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.config("*", {
	capabilities = capabilities,
})

if vim.fn.executable("vscode-html-language-server") == 1 then
  vim.lsp.config("html", {
    filetypes = {
      "html",
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
    },
    init_options = {
      provideFormatter = false,
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true,
      },
    },
  })
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
