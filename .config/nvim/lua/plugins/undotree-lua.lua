return {
  "jiaoshijie/undotree",
  commit = "eab459a",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    {
      "<leader>u",
      "<cmd>lua require('undotree').toggle()<cr>",
      desc = "Undotree: Toggle the undo tree explorer.",
    },
  },
}
