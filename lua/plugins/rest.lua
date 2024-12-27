return {
	{
		"rest-nvim/rest.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			require("rest-nvim").setup({
				-- Default configuration can be extended here if needed
			})

			-- Keybindings for REST operations
			vim.keymap.set("n", "<leader>rr", "<cmd>RestNvim<CR>", { desc = "Run HTTP request", silent = true })
			vim.keymap.set(
				"n",
				"<leader>rl",
				"<cmd>RestNvimLast<CR>",
				{ desc = "Run last HTTP request", silent = true }
			)
			vim.keymap.set(
				"n",
				"<leader>rp",
				"<cmd>RestNvimPreview<CR>",
				{ desc = "Preview HTTP request", silent = true }
			)
		end,
	},
}
