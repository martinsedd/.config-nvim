return {
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Octo", -- Lazy-load the plugin when the `Octo` command is invoked
		config = function()
			require("octo").setup({
				default_remote = { "origin" }, -- Set your default GitHub remote
				ssh_aliases = { "github.com" }, -- Configure SSH aliases if needed
				reaction_viewer_hint_icon = "", -- Customize icons (optional)
				user_icon = "", -- Customize user icons (optional)
				pull_request_icon = "", -- Icon for pull requests (optional)
				mappings = {
					issue = {
						close_issue = "<leader>ic", -- Close issue
						reopen_issue = "<leader>io", -- Reopen issue
						list_issues = "<leader>il", -- List issues
					},
					pull_request = {
						checkout_pr = "<leader>pc", -- Checkout PR
						merge_pr = "<leader>pm", -- Merge PR
					},
				},
			})

			-- Keybindings to invoke the Octo command
			vim.keymap.set("n", "<leader>gh", "<cmd>Octo<CR>", { desc = "Open Octo" })
		end,
	},
}
