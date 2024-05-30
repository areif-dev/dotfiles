local coc_extns = {}

coc_extns.extn_path = vim.fn.stdpath("config") .. "/../coc/extensions/node_modules/"
coc_extns.extensions = {
  "coc-html", 
  "coc-htmldjango",
  "coc-json",
  "coc-prettier",
  "coc-pyright",
  "coc-rust-analyzer", 
  "coc-tsserver",
}

-- Install or uninstall extensions as necessary such that the list of installed 
-- extensions exactly matches `coc_extns.extensions`
coc_extns.sync_extensions = function()
  -- Sort the list of extensions alphabetically so it matches with the filesystem
  table.sort(coc_extns.extensions)
  local to_sync = coc_extns.extensions

  local pfile = io.popen('ls "' .. coc_extns.extn_path .. '"')
  local installed, i = {}, 0
  for file in pfile:lines() do 
    i = i + 1
    installed[i] = file
  end
  pfile:close()

  i = 1
  local j = 1
  while(true) do 
    if to_sync[i] == nil and installed[j] == nil then 
      -- Reached the end of both lists, so exit 
      break
    elseif to_sync[i] == nil and installed[j] ~= nil then 
      vim.cmd("CocUninstall " .. installed[j])
      j = j + 1
    elseif to_sync[i] ~= nil and installed[j] == nil then 
      vim.cmd("CocInstall " .. to_sync[i])
      i = i + 1
    elseif to_sync[i] > installed[j] then 
      vim.cmd("CocUninstall " .. installed[j])
      j = j + 1
    elseif to_sync[i] < installed[j] then
      vim.cmd("CocInstall " .. to_sync[i])
      i = i + 1
    elseif to_sync[i] == installed[j] and to_sync[i] ~= nil then 
      i = i + 1
      j = j + 1
    else 
      break
    end
  end
end

return coc_extns
