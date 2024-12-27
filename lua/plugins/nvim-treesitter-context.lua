return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable the plugin
				max_lines = 0, -- No limit on the context lines displayed
				min_window_height = 0, -- Display context even in small windows
				line_numbers = true, -- Show line numbers in the context window
				multiline_threshold = 20, -- Show lines for up to 20 lines of context
				trim_scope = "outer", -- Trim context to outer scope
				mode = "cursor", -- Display context for the current cursor position
				separator = nil, -- No separator by default
			})

			-- Keybinding to toggle Treesitter Context
			vim.keymap.set("n", "<leader>tc", "<cmd>TSContextToggle<CR>", { desc = "Toggle Treesitter Context" })
		end,
	},
}
