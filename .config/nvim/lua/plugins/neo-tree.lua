return {
  {
    "nvim-lua/plenary.nvim",
    commit = "857c5ac",
  },
  {
    "nvim-tree/nvim-web-devicons",
    commit = "f142072",
  },
  {
    "MunifTanjim/nui.nvim",
    version = "^0.3.0",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local neoTree = require("neo-tree")
      neoTree.setup({
        window = {
          mappings = {
            ["l"] = "toggle_node",
            ["h"] = "close_node",
            ["g"] = "open",
          },
        },
        event_handlers = {
          {
            event = "file_open_requested",
            handler = function()
              vim.cmd("Neotree close")
            end,
          },
        },
      })
      vim.keymap.set(
        "n",
        "<leader>n",
        ":Neotree filesystem reveal position=left toggle<CR>",
        { desc = "NeoTree filesystem at the left of the screen." }
      )
      vim.keymap.set(
        "n",
        "<leader>s",
        ":Neotree git_status reveal position=right toggle<CR>",
        { desc = "NeoTree git_status at the right of the screen." }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<CR>",
        ':lua require("neo-tree").close()<CR>',
        { noremap = true, silent = true, desc = "Close the file system afther open the file" }
      )
    end,
  },
}
