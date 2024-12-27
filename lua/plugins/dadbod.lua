return {
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
			"kristijanhusak/vim-dadbod-completion",
		},
		cmd = {
			"DB",
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		config = function()
			-- Ensure `cmp` is loaded before configuring buffer sources
			local ok, cmp = pcall(require, "cmp")
			if ok then
				vim.api.nvim_create_autocmd("FileType", {
					pattern = "sql,mysql,plsql",
					callback = function()
						cmp.setup.buffer({
							sources = {
								{ name = "vim-dadbod-completion" },
							},
						})
					end,
				})
			else
				vim.notify("nvim-cmp not found, vim-dadbod-completion disabled", vim.log.levels.WARN)
			end

			-- Vim-Dadbod UI configurations
			vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
