local set = vim.opt

vim.filetype.add({
  extension = {
    django = "htmldjango",
    djt = "htmldjango",
    jinja = "htmldjango",
    jinja2 = "htmldjango",
    j2 = "htmldjango",
    hbs = "handlebars",
    handlebars = "handlebars",
    mustache = "mustache",
    liquid = "liquid",
    blade = "blade",
    gohtml = "gohtmltmpl",
    gohtmltmpl = "gohtmltmpl",
    gotmpl = "gotmpl",
  },
  pattern = {
    [".*%.django%.html"] = "htmldjango",
    [".*%.jinja%.html"] = "htmldjango",
    [".*%.j2%.html"] = "htmldjango",
    [".*%.html%.jinja"] = "htmldjango",
    [".*%.html%.j2"] = "htmldjango",
  },
})

local make_nix_conf = function() 
  local nix_pattern = {"*.nix"}
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},
    {
      pattern = nix_pattern,
      callback = function()
        set.tabstop = 2 
        set.shiftwidth = 2
      end
    }
  )
end

local make_web_stack_conf = function()
  local web_stack_pattern = {"*.html", "*.django", "*.jango", "*.hbs", "*.css", "*.js", "*.jsx", "*.json", "*.ts", "*.tsx", "*.gohtml", "*.liquid"}
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},
  {
    pattern = web_stack_pattern,
    callback = function()
      set.tabstop = 2
      set.shiftwidth = 2
    end
  })
end

local make_lua_config = function()
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},
  {
    pattern = {"*.lua"},
    callback = function()
      set.tabstop = 2
      set.shiftwidth = 2
    end
  })
end

local make_server_stack_conf = function()
  local server_stack_pattern = {"*.rs", "*.py"}
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},
  {
    pattern = server_stack_pattern,
    callback = function()
      set.tabstop = 4
      set.shiftwidth = 4
    end
  })
end

make_web_stack_conf()
make_lua_config()
make_server_stack_conf()
make_nix_conf()
