return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			htmlhint = { "htmlhint" },
			python = { "pylint" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		-- https://github.com/mfussenegger/nvim-lint/issues/482
		local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
		local client = get_clients({ bufnr = 0 })[1] or {}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint(nil, { cwd = client.root_dir })
			end,
		})

		vim.keymap.set("n", "<leader>gl", function()
			lint.try_lint(nil, { cwd = client.root_dir })
		end, { desc = "Trigger linting for current file" })
	end,
}
