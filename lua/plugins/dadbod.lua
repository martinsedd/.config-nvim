return {
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
			"kristijanhusak/vim-dadbod-completion",
		},
		opt = true,
		cmd = {
			"DB",
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "sql,mysql,plsql",
				callback = function()
					require("cmp").setup.buffer({
						sources = {
							{ name = "vim-dadbod-completion" },
						},
					})
				end,
			})

			vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
