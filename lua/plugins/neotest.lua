return {
	-- Neotest
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python", -- Add Python adapter
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						dap = { justMyCode = false },
					}),
				},
			})

			-- Keybindings for Neotest
			vim.keymap.set(
				"n",
				"<leader>tn",
				"<cmd>lua require('neotest').run.run()<CR>",
				{ desc = "Run nearest test" }
			)
			vim.keymap.set(
				"n",
				"<leader>tf",
				"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
				{ desc = "Run file tests" }
			)
			vim.keymap.set(
				"n",
				"<leader>to",
				"<cmd>lua require('neotest').output.open({ enter = true })<CR>",
				{ desc = "Show test output" }
			)
		end,
	},
}
