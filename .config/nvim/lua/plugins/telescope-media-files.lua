return {
  {
    "nvim-lua/popup.nvim"
  },
  {
    "mgallegoa/telescope-media-files.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        extensions = {
          media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "jpg", "jpeg", "webp", "svg", "gif", "pdf", "epub", "ttf", "mp4", "3gp", "mpeg" },
            -- find command (defaults to `fd`)
            find_cmd = "rg",
            -- command_open_imen = "display" -- Example to use imageMagick to show the image instead default eog
            command_open_image = 'gnome-terminal -- env TMUX="" kitty --hold kitten ica' -- Example to use the kitty terminal for the images

          }
        },
      })
    end,
    keys = {
      { "<leader>fm", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>" },
    }
  }
}
