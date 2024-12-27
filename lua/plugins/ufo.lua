return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		event = "BufRead",
		keys = {
			{
				"zR",
				function()
					require("ufo").openAllFolds()
				end,
				desc = "Open all folds",
			},
			{
				"zM",
				function()
					require("ufo").closeAllFolds()
				end,
				desc = "Close all folds",
			},
			{
				"zr",
				function()
					require("ufo").openFoldsExceptKinds()
				end,
				desc = "Open all folds except kinds",
			},
			{
				"zm",
				function()
					require("ufo").closeFoldsWith()
				end,
				desc = "Close all folds with",
			},
			{
				"K",
				function()
					local winid = require("ufo").peekFoldedLinesUnderCursor()
					if not winid then
						vim.lsp.buf.hover()
					end
				end,
				desc = "Peek folded lines",
			},
		},
		opts = {
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
			fold_virt_text_handler = nil,
			open_fold_hl_timeout = 150,
			close_fold_kinds = {},
			preview = {
				win_config = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "Normal:Folded",
					winblend = 0,
				},
			},
		},
		init = function()
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
		end,
	},
}