local M = {
	"akinsho/toggleterm.nvim",
	version = "*",
}

-- Terminal keybinding setup
local function set_terminal_keymaps()
	local opts = { buffer = 0 }
	local keymap = vim.keymap.set

	-- Terminal navigation
	keymap("t", "<esc>", [[<C-\><C-n>]], opts)
	keymap("t", "jk", [[<C-\><C-n>]], opts)
	keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

function M.config()
	require("toggleterm").setup({
		-- Size Configuration
		size = 20,
		persist_size = true,

		-- Appearance
		direction = "float",
		shade_terminals = true,
		shading_factor = 2,
		hide_numbers = true,

		-- Behavior
		open_mapping = [[<c-\>]],
		start_in_insert = true,
		close_on_exit = true,
		shell = vim.o.shell,

		-- Floating window configuration
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	})

	-- Set up terminal keymaps
	vim.api.nvim_create_autocmd("TermOpen", {
		pattern = "term://*",
		callback = function()
			set_terminal_keymaps()
		end,
	})
end

return M
