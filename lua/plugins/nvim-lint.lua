return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				lua = { "luacheck" }, -- Lua linter
				vim = { "vint" }, -- Vimscript linter
				vimdoc = { "vint" }, -- Vimdoc uses the same linter as Vimscript
				typescript = { "eslint" }, -- TypeScript linter
				javascript = { "eslint" }, -- JavaScript linter
				python = { "pylint" }, -- Python linter
				go = { "golangcilint" }, -- Go linter
				java = { "checkstyle" }, -- Java linter
				sql = { "sqlfluff" }, -- SQL linter
				json = { "jsonlint" }, -- JSON linter
				yaml = { "yamllint" }, -- YAML linter
				markdown = { "markdownlint" }, -- Markdown linter
				markdown_inline = { "markdownlint" }, -- Markdown Inline
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
