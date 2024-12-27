return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- Setup for web devicons
		require("nvim-web-devicons").setup({
			strict = true,
		})

		-- Configure nvim-tree
		require("nvim-tree").setup({
			update_cwd = false,
			respect_buf_cwd = false,
			view = {
				width = 30,
				relativenumber = true,
			},
			renderer = {
				highlight_git = true,
				group_empty = true,
				indent_markers = {
					enable = true,
				},
				icons = {
					git_placement = "after",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "",
							untracked = "",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			filters = {
				dotfiles = false,
			},
			git = {
				enable = true,
				ignore = false,
			},
			actions = {
				open_file = {
					quit_on_open = false,
					window_picker = {
						enable = true,
					},
				},
			},
		})

		-- Keybinding for toggling nvim-tree
		vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
		vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFile<CR>", { desc = "Find file in NvimTree" })
	end,
}
