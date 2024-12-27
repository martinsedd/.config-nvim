return {
	{
		"stevearc/oil.nvim",
		---@module "oil"
		---@type oil.SetupOpts
		opts = {
			-- Add any specific setup options here if needed
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function(_, opts)
			require("oil").setup(opts)

			-- Keybinding to toggle Oil
			vim.keymap.set("n", "<leader>oo", "<cmd>Oil<CR>", { desc = "Toggle Oil File Explorer" })
		end,
	},
}
