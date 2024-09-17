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
            filetypes = { "png", "jpg", "jpeg", "webp", "svg", "gif", "pdf", "epub", "ttf", "mp4", "3gp", "mpeg" }, -- default {"png", "jpg", "mp4", "webm", "pdf"}
            find_cmd = "rg",                                                                                        -- find command defaults to `fd`
            -- command_open_imen = "display" -- Example to use imageMagick to show the image instead default eog
            -- command_open_image = 'gnome-terminal -- env TMUX="" kitty --hold kitten ica' -- Example to use the kitty terminal for the images
            tmux_resize_open_pane = 30,
            -- show_file_details = 0,
            command_open_thumbnail = "kitten icat",
tmux_time_wait=1
          }
        },
      })
    end,
    keys = {
      { "<leader>fm", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>" },
      { "<leader>fn", "<cmd>lua require('telescope').extensions.media_files.media_files_console()<cr>" },
    }
  }
}
