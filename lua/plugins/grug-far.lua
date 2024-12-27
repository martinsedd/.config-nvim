return {
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({
				keymaps = {
					find = "<leader>f",
					find_visual = "<leader>f",
					replace = "<leader>r",
					replace_visual = "<leader>r",
				},
			})
		end,
	},
}
