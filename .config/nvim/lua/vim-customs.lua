vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("noremap aa <Esc>")
vim.cmd("inoremap aa <Esc>")

-- Make sure to setup `mapleader` and `maplocalleader` before
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.relativenumber = true
vim.wo.number = true
vim.o.scrolloff = 10

-- Copy the entire line to the clipboard
vim.keymap.set('n', '<leader>Y', '"+yy', { noremap = true, silent = true })
-- Copy the selected text to the clipboard
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- Move the pane (split), in an ease way
vim.keymap.set('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })

