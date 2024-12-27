return {
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("todo-comments").setup({
				signs = true, -- Show icons in the sign column
				highlight = {
					before = "", -- Don't highlight text before the keyword
					keyword = "wide", -- Highlight the entire keyword
					after = "fg", -- Highlight text after the keyword
				},
				colors = {
					error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
					warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
					info = { "DiagnosticInfo", "#2563EB" },
					hint = { "DiagnosticHint", "#10B981" },
					default = { "Identifier", "#7C3AED" },
				},
			})

			-- Keybinding to open the TODO list
			vim.keymap.set(
				"n",
				"<leader>td",
				"<cmd>TodoTelescope<CR>",
				{ desc = "Search TODO comments with Telescope", noremap = true, silent = true }
			)
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
}
