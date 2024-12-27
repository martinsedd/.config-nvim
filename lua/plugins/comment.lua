return {
	{
		"numToStr/Comment.nvim",
		opts = {},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
		keys = {
			{ "gcc", desc = "Comment toggle linewise" },
			{ "gc", mode = "v", desc = "Comment toggle blockwise (visual)" },
		},
	},
}
