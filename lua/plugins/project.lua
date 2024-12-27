return {
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				-- Show hidden files in telescope
				show_hidden = true,

				-- Detection methods for identifying project root
				detection_methods = { "pattern", "lsp" },

				-- Patterns to identify project root directory
				patterns = {
					".git",
					"_darcs",
					".hg",
					".bzr",
					".svn",
					"Makefile",
					"package.json",
					"go.mod",
					"requirements.txt",
					"pyproject.toml",
					"Cargo.toml",
					"composer.json",
					"gradlew",
					"pom.xml",
				},

				-- Automatically change directory when project is detected
				silent_chdir = true,

				-- Scope to search for projects
				scope_chdir = "global",

				-- Automatically update project history
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
			})

			-- Telescope integration
			require("telescope").load_extension("projects")

			-- Keybinding for project search
			vim.keymap.set(
				"n",
				"<leader>fp",
				"<cmd>Telescope projects<CR>",
				{ desc = "Find Projects with Telescope", noremap = true, silent = true }
			)
		end,
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = false,
	},
}
