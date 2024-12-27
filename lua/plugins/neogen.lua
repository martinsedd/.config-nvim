return {
	{
		"danymat/neogen",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = true,
		cmd = { "Neogen" },
		keys = {
			{ "<leader>ng", "<cmd>Neogen<CR>", desc = "Generate annotation with Neogen" },
		},
	},
}
