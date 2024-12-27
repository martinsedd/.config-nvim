return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"williamboman/mason.nvim",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
			"microsoft/vscode-js-debug",
			"mfussenegger/nvim-jdtls",
			"mfussenegger/nvim-dap-python",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
			require("dap-go").setup()
			require("dap-vscode-js").setup({
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = {
					"pwa-node",
					"pwa-chrome",
					"pwa-msedge",
					"node-terminal",
					"pwa-extensionHost",
				},
			})

			for _, language in ipairs({ "typescript", "javascript" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Lanch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
				}
			end

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>dc", dap.continue, {})
			vim.keymap.set("n", "<leader>ds", dap.step_over, {})
			vim.keymap.set("n", "<leader>di", dap.step_into, {})
			vim.keymap.set("n", "<leader>do", dap.step_out, {})
			vim.keymap.set("n", "<leader>dt", dap.terminate, {})
			vim.keymap.set("n", "<leader>du", dapui.toggle, {})
		end,
	},
}
