return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					header = {
						"",
						"███╗   ███╗ █████╗ ██████╗ ████████╗██╗███╗   ██╗███████╗███████╗██████╗ ██████╗ ",
						"████╗ ████║██╔══██╗██╔══██╗╚══██╔══╝██║████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗",
						"██╔████╔██║███████║██████╔╝   ██║   ██║██╔██╗ ██║███████╗█████╗  ██║  ██║██║  ██║",
						"██║╚██╔╝██║██╔══██║██╔══██╗   ██║   ██║██║╚██╗██║╚════██║██╔══╝  ██║  ██║██║  ██║",
						"██║ ╚═╝ ██║██║  ██║██║  ██║   ██║   ██║██║ ╚████║███████║███████╗██████╔╝██████╔╝",
						"╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝ ╚═════╝ ",
						"",
					},
					center = {
						{
							icon = " ",
							icon_hl = "Title",
							desc = "Find File",
							desc_hl = "String",
							key = "f",
							key_hl = "Number",
							action = "Telescope find_files",
						},
						{
							icon = " ",
							icon_hl = "Title",
							desc = "Recent Files",
							desc_hl = "String",
							key = "r",
							key_hl = "Number",
							action = "Telescope oldfiles",
						},
						{
							icon = " ",
							icon_hl = "Title",
							desc = "Find Word",
							desc_hl = "String",
							key = "w",
							key_hl = "Number",
							action = "Telescope live_grep",
						},
					},
				},
			})
		end,
	},
}
