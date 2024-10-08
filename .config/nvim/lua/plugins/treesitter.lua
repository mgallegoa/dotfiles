return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      --Replaced the next line to automate recognize the languaje
      -- ensure_installed = { "lua", "vim", "javascript", "html" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
