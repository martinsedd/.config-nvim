return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- Configure linters for each filetype
			lint.linters_by_ft = {
				lua = { "luacheck" },
				vim = { "vint" },
				vimdoc = { "vint" },
				typescript = { "eslint" },
				javascript = { "eslint" },
				python = { "pylint" },
				go = { "golangcilint" },
				java = { "checkstyle" },
				sql = { "sqlfluff" },
				json = { "jsonlint" },
				yaml = { "yamllint" },
				markdown = { "markdownlint" },
				markdown_inline = { "markdownlint" },
			}

			-- Automatically lint files on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					lint.try_lint()
				end,
				desc = "Run linter on file save",
			})

			-- Optional keybinding to manually trigger linting
			vim.keymap.set("n", "<leader>li", function()
				lint.try_lint()
			end, { desc = "Run linting manually" })
		end,
	},
}
