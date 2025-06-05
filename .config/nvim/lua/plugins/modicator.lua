-- This modicator (modify indicator) is for highlight the line number https://github.com/mawkler/modicator.nvim
return {
  "mawkler/modicator.nvim",
  -- commit = "45b6456", -- Latest but error for Nvim 0.11.2
  commit = "1940afc",
  enabled = true,
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
