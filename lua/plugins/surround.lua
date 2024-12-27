return {
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Add additional setup options if needed
			})

			-- Optional keybinding documentation for common surround actions
			vim.keymap.set("n", "ys", "<cmd>NvimSurroundAdd<CR>", { desc = "Add surrounding characters" })
			vim.keymap.set("n", "ds", "<cmd>NvimSurroundDelete<CR>", { desc = "Delete surrounding characters" })
			vim.keymap.set("n", "cs", "<cmd>NvimSurroundChange<CR>", { desc = "Change surrounding characters" })
		end,
	},
}
