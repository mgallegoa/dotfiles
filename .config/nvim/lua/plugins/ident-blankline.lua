return {
  "lukas-reineke/indent-blankline.nvim",
  version = "^3.8.5",
  main = "ibl",
  opts = {},

  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#EDABB0" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#EED6AA" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#A2D0F6" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#E8CBB0" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#C9DFB9" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#DCADEB" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#B4DEE4" })
    end)

    require("ibl").setup({ indent = { highlight = highlight } })
  end,
}
