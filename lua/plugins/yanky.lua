return {
	{
		"gbprod/yanky.nvim",
		opts = {
			ring = {
				history_length = 100, -- Number of yanks to keep in history
				storage = "shada", -- Use shada file for persistence
			},
			highlight = {
				on_put = true, -- Highlight text after a yank
				on_yank = true, -- Highlight yanked text
				timer = 150, -- Duration of highlight in milliseconds
			},
			system_clipboard = {
				sync_with_ring = true, -- Sync yanks with system clipboard
			},
		},
		config = function(_, opts)
			require("yanky").setup(opts)

			-- Keybindings for yank operations
			vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", { desc = "Yanky Put After" })
			vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", { desc = "Yanky Put Before" })
			vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)", { desc = "Yanky GPut After" })
			vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", { desc = "Yanky GPut Before" })
			vim.keymap.set("n", "<leader>yy", "<cmd>YankyRingHistory<CR>", { desc = "Show Yank History" })
		end,
	},
}
