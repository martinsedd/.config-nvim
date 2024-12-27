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

			-- DAP UI setup
			dapui.setup()

			-- Open/close DAP UI on debugging events
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Python debugging setup
			require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

			-- Go debugging setup
			require("dap-go").setup()

			-- JavaScript/TypeScript debugging setup
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

			-- Configurations for JavaScript and TypeScript
			for _, language in ipairs({ "typescript", "javascript" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
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

			-- Keybindings for DAP
			local opts = { desc = "DAP: " }
			vim.keymap.set(
				"n",
				"<leader>db",
				dap.toggle_breakpoint,
				vim.tbl_extend("force", opts, { desc = "Toggle breakpoint" })
			)
			vim.keymap.set("n", "<leader>dc", dap.continue, vim.tbl_extend("force", opts, { desc = "Continue" }))
			vim.keymap.set("n", "<leader>ds", dap.step_over, vim.tbl_extend("force", opts, { desc = "Step over" }))
			vim.keymap.set("n", "<leader>di", dap.step_into, vim.tbl_extend("force", opts, { desc = "Step into" }))
			vim.keymap.set("n", "<leader>do", dap.step_out, vim.tbl_extend("force", opts, { desc = "Step out" }))
			vim.keymap.set(
				"n",
				"<leader>dt",
				dap.terminate,
				vim.tbl_extend("force", opts, { desc = "Terminate debugging" })
			)
			vim.keymap.set("n", "<leader>du", dapui.toggle, vim.tbl_extend("force", opts, { desc = "Toggle DAP UI" }))
		end,
	},
}
