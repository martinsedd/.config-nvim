return {
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("harpoon").setup({})

			-- Keybindings with descriptions
			vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file, { desc = "Add file to Harpoon" })
			vim.keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu, { desc = "Toggle Harpoon menu" })
			vim.keymap.set("n", "<leader>1", function()
				require("harpoon.ui").nav_file(1)
			end, { desc = "Navigate to Harpoon file 1" })
			vim.keymap.set("n", "<leader>2", function()
				require("harpoon.ui").nav_file(2)
			end, { desc = "Navigate to Harpoon file 2" })
			vim.keymap.set("n", "<leader>3", function()
				require("harpoon.ui").nav_file(3)
			end, { desc = "Navigate to Harpoon file 3" })
			vim.keymap.set("n", "<leader>4", function()
				require("harpoon.ui").nav_file(4)
			end, { desc = "Navigate to Harpoon file 4" })
		end,
	},
}
