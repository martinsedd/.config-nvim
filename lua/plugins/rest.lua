return {
	{
		"rest-nvim/rest.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			require("rest-nvim").setup({})

			vim.api.nvim_set_keymap("n", "<leader>rr", "<cmd>Rest run<CR>", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>rl", "<cmd>Rest last<CR>", { noremap = false, silent = true })
		end,
	},
}
