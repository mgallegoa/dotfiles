return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Upgrade to fix the error https://github.com/nvimtools/none-ls.nvim/discussions/81
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({

      source = {
        -- LUA
        null_ls.builtins.formatting.stylua,

        ------------------------------
        --- JS | TS | HTML | CSS and more...
        null_ls.builtins.formatting.prettier,
        -- Upgrade to fix the error https://github.com/nvimtools/none-ls.nvim/discussions/81
        require("none-ls.diagnostics.eslint_d"),
        ------------------------------
      }
    })
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end,
}
