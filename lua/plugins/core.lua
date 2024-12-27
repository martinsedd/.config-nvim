-- ~/.config/nvim/lua/plugins/core.lua
return {
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"typescript",
					"javascript",
					"python",
					"go",
					"java",
					"sql",
					"json",
					"yaml",
					"markdown",
					"markdown_inline",
				},
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
			})
		end,
	},

	-- which-key.nvim
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Show buffer-local keymaps",
			},
		},
	},

	-- telescope.nvim
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Help Tags" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git/" },
					mappings = {
						i = {
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
						n = {
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
				pickers = {
					find_files = { hidden = true },
				},
			})
			telescope.load_extension("fzf")
		end,
	},

	-- nvim-treesitter-textobjects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
						},
					},
				},
			})
		end,
	},

	-- nvim-ts-autotag
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = {
					"html",
					"javascript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
					"tsx",
					"jsx",
					"xml",
					"php",
					"markdown",
					"astro",
				},
			})
		end,
	},
}
