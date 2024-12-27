return {
	{
		"stevearc/overseer.nvim",
		cmd = { "OverseerRun", "OverseerToggle" },
		keys = {
			{ "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run Task" },
			{ "<leader>ot", "<cmd>OverseerToggle", desc = "Toggle Task Manager" },
		},
		config = function()
			require("overseer").setup({
				strategy = {
					default = "toggleterm",
				},
				templates = { "builtin" },
				task_list = {
					default_detail = 1,
					direction = "right",
					bindings = {
						["<CR>"] = "open",
						["<C-s>"] = "split",
						["<C-v>"] = "vsplit",
						["<C-t>"] = "tab",
						["q"] = "Close",
					},
				},
			})
		end,
	},
}
