return {
  "nvim-lualine/lualine.nvim",
  commit = "d3ff696",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "dracula",
      },
    })
  end,
}
