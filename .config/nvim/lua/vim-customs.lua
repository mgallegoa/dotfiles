vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set signcolumn=yes")
vim.cmd("noremap ff <Esc>")
vim.cmd("inoremap ff <Esc>")

-- Smart case sensitive. Active casesensitive only by lower-case search
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

-- Make sure to setup `mapleader` and `maplocalleader` before
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.relativenumber = true
vim.wo.number = true
vim.o.scrolloff = 10

-- clipboard copy and paste from SO. Comment for personal copy and past see <leader>y keys
-- vim.cmd("set clipboard^=unnamed,unnamedplus")

-- Enable spell checking by default
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.o.mousemodel = "popup"

vim.keymap.set(
	{ "n", "v" },
	"<leader>w",
	":wa<CR>",
	{ noremap = true, silent = true, desc = "Write in all files. : wa" }
)
vim.keymap.set({ "n", "v" }, "<leader>q", ":q<CR>", { noremap = true, desc = "Quit the file. : q" })

vim.keymap.set({ "n", "v" }, "<leader>z", "$", { noremap = true, silent = true, desc = "Go to the end of the line" })
vim.keymap.set({ "n", "v" }, "<leader>a", "0", { noremap = true, silent = true, desc = "Go to the begin of the line" })

vim.keymap.set(
	"n",
	"<leader>Y",
	'"+yy',
	{ noremap = true, silent = true, desc = "Copy the entire line to the clipboard" }
)
vim.keymap.set(
	"v",
	"<leader>y",
	'"+y',
	{ noremap = true, silent = true, desc = "Copy the selected text to the clipboard" }
)

vim.keymap.set("n", "n", "nzzzv", { desc = "Goes to the next result on the seach and put the cursor in the middle" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Goes to the prev result on the seach and put the cursor in the middle" })

-- Move the pane (split), in an ease way
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, silent = true, desc = "Move pane to left (h)" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, silent = true, desc = "Move pane to right (l)" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, silent = true, desc = "Move pane to up (k)" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, silent = true, desc = "Move pane to down (j)" })

-- Easy for recise the nvim panes
vim.keymap.set(
	"n",
	"<M-H>",
	":vertical resize -2<CR>",
	{ noremap = true, silent = true, desc = "Move pane to left (h)" }
)
vim.keymap.set("n", "<M-J>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Move pane to down (j)" })
vim.keymap.set("n", "<M-K>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Move pane to up (k)" })
vim.keymap.set(
	"n",
	"<M-L>",
	":vertical resize +2<CR>",
	{ noremap = true, silent = true, desc = "Move pane to right (l)" }
)

-- Split windows
vim.keymap.set("n", "ss", ":vsplit<Return>", { noremap = true, silent = true, desc = "Split : Create a vsplit window" })
vim.keymap.set("n", "sv", ":split<Return>", { noremap = true, silent = true, desc = "Split : Create a hsplit window" })

-- Tabs
vim.keymap.set("n", "te", ":tabedit", { noremap = true, silent = true, desc = "Tabs : Create a new vim tab" })
vim.keymap.set("n", "<C-tab>", ":tabn<Return>", { noremap = true, silent = true, desc = "Tabs : Move to next tab" })
vim.keymap.set("n", "<s-tab>", ":tabp<Return>", { noremap = true, silent = true, desc = "Tabs : Move to previous tab" })

-- Buffers
vim.keymap.set("n", "<tab>", ":b#<Return>", { noremap = true, silent = true, desc = "Buffers : Next buffer" })
