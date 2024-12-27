local M = {
	"akinsho/toggleterm.nvim",
	version = "*",
}

-- Terminal keybinding setup
local function set_terminal_keymaps()
	local opts = { buffer = 0 }
	local keymap = vim.keymap.set

	-- Terminal navigation
	keymap("t", "<esc>", [[<C-\><C-n>]], opts) -- Exit terminal mode
	keymap("t", "jk", [[<C-\><C-n>]], opts) -- Alternative terminal exit
	keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts) -- Navigate to left window
	keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts) -- Navigate to bottom window
	keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts) -- Navigate to top window
	keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts) -- Navigate to right window
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
		open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl+\
		start_in_insert = true,
		close_on_exit = true,
		shell = vim.o.shell,

		-- Floating window configuration
		float_opts = {
			border = "curved", -- Curved border for floating terminal
			winblend = 0,
			highlights = {
				border = "Normal", -- Border highlight group
				background = "Normal", -- Background highlight group
			},
		},
	})

	-- Automatically set terminal keymaps on terminal open
	vim.api.nvim_create_autocmd("TermOpen", {
		pattern = "term://*",
		callback = function()
			set_terminal_keymaps()
		end,
	})
end

return M
