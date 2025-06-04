-- DIAGNOSTIC API
vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = "»", -- or "●", "▶", "", etc.
  },
  underline = true,
  signs = true,
  update_in_insert = false,
})

-- LSP Verify if java jdtls is using src.zip
vim.api.nvim_create_user_command("CheckJavaSrcZip", function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result)
    if err then
      vim.notify("LSP error: " .. err.message, vim.log.levels.ERROR)
      return
    end

    if not result or vim.tbl_isempty(result) then
      vim.notify("No result returned from definition", vim.log.levels.WARN)
      return
    end

    local uri = result.uri or result[1].uri
    if uri:find("src.zip") then
      vim.notify("✅ JDK sources loaded from: " .. uri, vim.log.levels.INFO)
    else
      vim.notify("⚠️ Not using src.zip. URI: " .. uri, vim.log.levels.WARN)
    end
  end)
end, {})

-- LSP : To debug the java LSP to open source
-- vim.api.nvim_create_autocmd("BufReadCmd", {
--   pattern = "jdt://*",
--   callback = function()
--     print("Opening JDT class URI:", vim.fn.expand("<amatch>"))
--   end,
-- })
