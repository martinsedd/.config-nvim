return {
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = function()
			require("bqf").setup({
				auto_enable = true, -- Automatically enable bqf for quickfix windows
				preview = {
					win_height = 12, -- Height of the preview window
					win_vheight = 12, -- Height of the vertical preview window
					delay_syntax = 50, -- Delay syntax highlighting for large files
					border_chars = { "│", "│", "─", "─", "╭", "╮", "╯", "╰" }, -- Border for the preview window
				},
				func_map = {
					open = "<CR>", -- Key to open the current item
					split = "s", -- Key to open in horizontal split
					vsplit = "v", -- Key to open in vertical split
					tab = "t", -- Key to open in a new tab
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split", ["ctrl-v"] = "vsplit", ["ctrl-t"] = "tab" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
}
