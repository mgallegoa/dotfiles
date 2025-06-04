_G.lsp_on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
  end
  -- map("n", "gd", vim.lsp.buf.definition, "[LSP] Go to definition")
  map({ "n", "v" }, "<leader>k", vim.lsp.buf.hover, "LSP: Available documentation.")
  map({ "n", "v" }, "<leader>gd", vim.lsp.buf.definition, "LSP: Go to definition.")
  map({ "n", "v" }, "<leader>gD", vim.lsp.buf.declaration, "LSP: Go to declaration.")
  map({ "n", "v" }, "<leader>gr", vim.lsp.buf.references, "LSP: Got to references.")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code actions.")
  map({ "n", "v" }, "<leader>gc", vim.lsp.buf.rename, "LSP: rename, go to change gc.")
  map({ "i" }, "<C>n", ":cnext<CR>", "LSP: Navegate next in the floating window.")
  map({ "i" }, "<C>p", ":cprev<CR>", "LSP: Navegate provious in the floating window.")
end
return {
  {
    "mason-org/mason.nvim",
    version = "^2.0.0",
    lazy = false,
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^2.0.0",
    lazy = false,
    opts = {
      automatic_enable = {
        exclude = { "jdtls" }, -- This is started using nvim-jdtls
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    version = "^2.2.0",
    lazy = false,
    opts = {},
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.lsp.config("lua_ls", {
        on_attach = _G.lsp_on_attach,
        capabilities = capabilities,
      })
      vim.lsp.config("ts_ls", {
        -- init_options = {
        -- 	preferences = {
        -- 		disableSuggestions = true,
        -- 	},
        -- },
        on_attach = _G.lsp_on_attach,
        capabilities = capabilities,
      })
      vim.lsp.config("html", {
        on_attach = _G.lsp_on_attach,
        capabilities = capabilities,
      })
      vim.lsp.config("cssls", {
        on_attach = _G.lsp_on_attach,
        capabilities = capabilities,
      })
    end,
  },
}
