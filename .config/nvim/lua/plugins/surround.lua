return {
  "kylechui/nvim-surround",
  -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
  version = "^2.3.0",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}
