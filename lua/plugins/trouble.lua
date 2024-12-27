return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for file icons
		config = function()
			require("trouble").setup({
				-- Customize settings if needed
				auto_open = false, -- Automatically open Trouble when errors are present
				auto_close = false, -- Automatically close Trouble when errors are fixed
				auto_preview = false, -- Disable preview by default
				use_diagnostic_signs = true, -- Use LSP diagnostic signs
			})

			-- Keybindings for Trouble
			vim.keymap.set(
				"n",
				"<leader>xx",
				"<cmd>TroubleToggle<CR>",
				{ desc = "Toggle Trouble", noremap = true, silent = true }
			)
			vim.keymap.set(
				"n",
				"<leader>xw",
				"<cmd>TroubleToggle workspace_diagnostics<CR>",
				{ desc = "Workspace Diagnostics", noremap = true, silent = true }
			)
			vim.keymap.set(
				"n",
				"<leader>xd",
				"<cmd>TroubleToggle document_diagnostics<CR>",
				{ desc = "Document Diagnostics", noremap = true, silent = true }
			)
			vim.keymap.set(
				"n",
				"<leader>xl",
				"<cmd>TroubleToggle loclist<CR>",
				{ desc = "Location List", noremap = true, silent = true }
			)
			vim.keymap.set(
				"n",
				"<leader>xq",
				"<cmd>TroubleToggle quickfix<CR>",
				{ desc = "Quickfix List", noremap = true, silent = true }
			)
			vim.keymap.set(
				"n",
				"gR",
				"<cmd>TroubleToggle lsp_references<CR>",
				{ desc = "LSP References", noremap = true, silent = true }
			)
		end,
	},
}
