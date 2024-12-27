return {
	{
		"stevearc/overseer.nvim",
		cmd = { "OverseerRun", "OverseerToggle" },
		keys = {
			{ "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run Task" },
			{ "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Toggle Task Manager" },
		},
		config = function()
			require("overseer").setup({
				strategy = {
					default = "toggleterm", -- Default strategy for task execution
				},
				templates = { "builtin" }, -- Use built-in templates
				task_list = {
					default_detail = 1, -- Default detail level
					direction = "right", -- Task list opens to the right
					bindings = {
						["<CR>"] = "open", -- Open task details
						["<C-s>"] = "split", -- Open in a horizontal split
						["<C-v>"] = "vsplit", -- Open in a vertical split
						["<C-t>"] = "tab", -- Open in a new tab
						["q"] = "close", -- Close the task list
					},
				},
			})

			-- Additional keybinding for task quick-access
			vim.keymap.set("n", "<leader>on", "<cmd>OverseerNew<CR>", { desc = "Create New Task" })
		end,
	},
}
