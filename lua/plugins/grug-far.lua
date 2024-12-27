return {
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({
				keymaps = {
					find = "<leader>f", -- Trigger find mode
					find_visual = "<leader>f", -- Trigger find in visual mode
					replace = "<leader>r", -- Trigger replace mode
					replace_visual = "<leader>r", -- Trigger replace in visual mode
				},
			})
			-- Add descriptions for keybindings to enhance clarity
			vim.keymap.set("n", "<leader>f", ":GrugFarFind<CR>", { desc = "Find using Grug-Far" })
			vim.keymap.set("x", "<leader>f", ":GrugFarFind<CR>", { desc = "Find (Visual) using Grug-Far" })
			vim.keymap.set("n", "<leader>r", ":GrugFarReplace<CR>", { desc = "Replace using Grug-Far" })
			vim.keymap.set("x", "<leader>r", ":GrugFarReplace<CR>", { desc = "Replace (Visual) using Grug-Far" })
		end,
	},
}
