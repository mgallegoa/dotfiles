-- This plugin help to comment the line and blocks. https://github.com/numToStr/Comment.nvim
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('Comment').setup()
  end
}
