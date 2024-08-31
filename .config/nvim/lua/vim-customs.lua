vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("noremap ff <Esc>")
vim.cmd("inoremap ff <Esc>")

-- Make sure to setup `mapleader` and `maplocalleader` before
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.relativenumber = true
vim.wo.number = true
vim.o.scrolloff = 10

vim.keymap.set('n', '<leader>Y', '"+yy', { noremap = true, silent = true, desc = "Copy the entire line to the clipboard" })
vim.keymap.set('v', '<leader>y', '"+y',
  { noremap = true, silent = true, desc = "Copy the selected text to the clipboard" })

vim.keymap.set('n', 'n', 'nzzzv', { desc = "Goes to the next result on the seach and put the cursor in the middle" })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Goes to the prev result on the seach and put the cursor in the middle" })

-- Move the pane (split), in an ease way
vim.keymap.set('n', '<leader>h', '<C-w>h', { noremap = true, silent = true, desc = "Move pane to left (h)" })
vim.keymap.set('n', '<leader>l', '<C-w>l', { noremap = true, silent = true, desc = "Move pane to right (l)" })
vim.keymap.set('n', '<leader>k', '<C-w>k', { noremap = true, silent = true, desc = "Move pane to up (k)" })
vim.keymap.set('n', '<leader>j', '<C-w>j', { noremap = true, silent = true, desc = "Move pane to down (j)" })
