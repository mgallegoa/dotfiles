return {
  {
    "nvim-telescope/telescope.nvim",
    version = "^0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: find file, ff" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: find grep, fg" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: find in buffer, fb" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: find help tags, fh" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope: find keymap, fk" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    commit = "6e51d7d",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        defaults = {
          file_ignore_patterns = {
            "%.class",
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
