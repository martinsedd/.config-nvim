-- lua/plugins/coding/completion.lua
return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Load VSCode-like snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- Navigate to previous item
					["<C-j>"] = cmp.mapping.select_next_item(), -- Navigate to next item
					["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
					["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll documentation down
					["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion menu
					["<C-e>"] = cmp.mapping.abort(), -- Abort completion
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP source
					{ name = "luasnip" }, -- Snippet source
					{ name = "buffer" }, -- Buffer source
					{ name = "path" }, -- File path source
				}),
			})

			-- Keybinding for reloading LuaSnip snippets
			vim.keymap.set(
				"n",
				"<leader>sr",
				"<cmd>lua require('luasnip.loaders.from_vscode').lazy_load()<CR>",
				{ desc = "Reload LuaSnip snippets" }
			)
		end,
	},
}
