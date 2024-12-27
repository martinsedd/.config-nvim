return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local ok, conform = pcall(require, "conform")
			if not ok then
				vim.notify("Failed to load conform.nvim", vim.log.levels.ERROR)
				return
			end

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					vim = { "vimlint" },
					vimdoc = { "vimlint" },
					typescript = { "prettier" },
					javascript = { "prettier" },
					python = { "black" },
					go = { "gofmt" },
					java = { "google_java_format" },
					sql = { "sql_formatter" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					markdown_inline = { "prettier" },
				},
				format_on_save = {
					enabled = true,
					timeout_ms = 1000,
				},
				log_level = vim.log.levels.ERROR,
				notify_on_error = true,
				notify_no_formatters = true,
			})
		end,
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true })
				end,
				desc = "Format buffer",
			},
		},
	},
}
