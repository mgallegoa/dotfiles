return {
  "nvim-lualine/lualine.nvim",
  commit = "15884ce",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "dracula",
      },
    })
  end,
}
