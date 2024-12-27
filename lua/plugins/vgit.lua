return {
	{
		"tanvirtin/vgit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("vgit").setup({
				keymaps = {
					["n <leader>gk"] = "hunk_up", -- Move to previous hunk
					["n <leader>gj"] = "hunk_down", -- Move to next hunk
					["n <leader>gp"] = "preview_hunk", -- Preview the current hunk
					["n <leader>gr"] = "reset_hunk", -- Reset the current hunk
					["n <leader>gb"] = "buffer_blame_preview", -- Blame preview
				},
			})

			-- Additional Vgit Commands
			vim.keymap.set("n", "<leader>gl", "<cmd>VGit log<CR>", { desc = "Git Log (Vgit)" })
			vim.keymap.set("n", "<leader>gS", "<cmd>VGit status<CR>", { desc = "Git Status (Vgit)" })
		end,
	},
}
