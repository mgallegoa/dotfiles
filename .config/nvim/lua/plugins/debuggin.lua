return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui, widgets = require("dap"), require("dapui"), require("dap.ui.widgets")

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.fn.sign_define("DapBreakpoint", { text = "🦞", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "🤺", texthl = "", linehl = "", numhl = "" })

		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debug: continue or start, dc" })
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint, dt" })
		-- vim.keymap.set("n", "<Leader>dn", dap.step_over, { desc = "Debug: step over next, dn" })
		-- vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Debug: step into, di" })
		-- vim.keymap.set("n", "<Leader>dp", dap.step_out, { desc = "Debug: step out previous, dp" })
		vim.keymap.set("n", "J", dap.step_over, { desc = "Debug: step over next, J" })
		vim.keymap.set("n", "H", dap.step_into, { desc = "Debug: step into, H" })
		vim.keymap.set("n", "K", dap.step_out, { desc = "Debug: step out previous, K" })
		vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Debug: repl open, dr" })
		vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Debug: run last, dl" })

		vim.keymap.set({ "n", "v" }, "<Leader>dh", widgets.hover, { desc = "Debug: DapUI widget hover, dh" })
		vim.keymap.set({ "n", "v" }, "<Leader>dw", widgets.preview, { desc = "Debug: DapUI previous widget, dw" })
		vim.keymap.set("n", "<Leader>df", function()
			widgets.centered_float(widgets.frames)
		end)
		vim.keymap.set("n", "<Leader>ds", function()
			widgets.centered_float(widgets.scopes)
		end)

		vim.keymap.set("n", "<Leader>do", dapui.open, { desc = "Debug: DapUI open, do" })
		vim.keymap.set("n", "<Leader>dx", dapui.close, { desc = "Debug: DapUI close x, dx" })

		-- dd the adapter definition for JavaScript
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				-- 💀 Make sure to update this path to point to your installation
				args = {
					os.getenv("HOME")
						.. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
					"${port}",
				},
			},
		}

		-- Add a configuration for JavaScript
		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
		}

		-- https://tsx.is/vscode#VPContent
		-- Add a configuration for TypeScript - add to tsx --inspect-brk ./src/server.ts
		dap.configurations.typescript = {
			{
				type = "pwa-node", -- To use new vscode-dap-debug
				request = "attach", -- For new process, attach for attach
				name = "Typescript attach debbuger node",
				port = "9229",
				skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" }, -- skip internals, focus in the code
			},
		}

		-- Add a configuration for TypeScript. It require tsx installed globally
		-- dap.configurations.typescript = {
		-- 	{
		-- 		type = "pwa-node", -- To use new vscode-dap-debug
		-- 		request = "launch", -- For new process, attach for attach
		-- 		name = "Typescript debbuger pwa-node",
		-- 		program = "${file}",
		-- 		runtimeExecutable = "tsx",
		-- 		console = "integratedTerminal",
		-- 		skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" }, -- skip internals, focus in the code
		-- 	},
		-- }
	end,
}
