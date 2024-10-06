return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			vim.keymap.set(
				{ "n", "v" },
				"<leader>i",
				vim.lsp.buf.hover,
				{ noremap = true, desc = "LSP: Available documentation." }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>gd",
				vim.lsp.buf.definition,
				{ noremap = true, desc = "LSP: Go to definition." }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>gr",
				vim.lsp.buf.references,
				{ noremap = true, desc = "LSP: Got to references." }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ noremap = true, desc = "LSP: Code actions." }
			)
			vim.keymap.set({ "n", "v" }, "<leader>rn", vim.lsp.buf.rename, { noremap = true, desc = "LSP: rename." })

			-- Keys to navigate the floating window
			vim.keymap.set({ "i" }, "<C>n", ":cnext<CR>", { noremap = true, silent = true })
			vim.keymap.set({ "i" }, "<C>p", ":cprev<CR>", { noremap = true, silent = true })
		end,
	},
}
