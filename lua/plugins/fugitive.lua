return {

	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gdiffsplit", "Gwrite", "Gread" },
		keys = {
			{ "<leader>gs", "<cmd>Git<CR>", desc = "Git Status (Fugitive)" },
			{ "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git Diff Split (Fugitive)" },
			{ "<leader>gw", "<cmd>Gwrite<CR>", desc = "Git Add/Write File (Fugitive)" },
			{ "<leader>gr", "<cmd>Gread<CR>", desc = "Git Read File (Fugitive)" },
		},
	},
}
