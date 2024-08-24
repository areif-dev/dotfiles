local set = vim.opt

local make_html_conf = function()
  local html_pattern = {"*.html", "*.django", "*.jango", "*.hbs"}
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, 
    {
      pattern = html_pattern,
      callback = function()
        vim.bo.filetype = "htmldjango"
      end
    })
end

local make_web_stack_conf = function()
  local web_stack_pattern = {"*.html", "*.django", "*.jango", "*.hbs", "*.css", "*.js", "*.jsx", "*.json", "*.ts", "*.tsx"}
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},
  {
    pattern = web_stack_pattern,
    callback = function()
      set.tabstop = 2
      set.shiftwidth = 2
    end
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = web_stack_pattern,
    command = ":CocCommand prettier.forceFormatDocument"
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

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = server_stack_pattern,
    command = ":CocCommand editor.action.formatDocument"
  })
end

make_html_conf()
make_web_stack_conf()
make_lua_config()
make_server_stack_conf()
