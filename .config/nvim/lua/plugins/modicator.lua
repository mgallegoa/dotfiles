-- This modicator (modify indicator) is for highlight the line number https://github.com/mawkler/modicator.nvim
return {
  "mawkler/modicator.nvim",
  commit = "45b6456",
  dependencies = "catppuccin/nvim", -- Theme here
  init = function()
    -- These are required for Modicator to work
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  config = function()
    require("modicator").setup()
  end,
}
