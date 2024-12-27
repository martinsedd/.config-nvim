local m = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
m("n", "<C-h>", "<C-w>h", opts)
m("n", "<C-j>", "<C-w>j", opts)
m("n", "<C-k>", "<C-w>k", opts)
m("n", "<C-l>", "<C-w>l", opts)

-- Window management
m("n", "<leader>sv", "<C-w>v", opts) -- split vertical
m("n", "<leader>sh", "<C-w>s", opts) -- split horizontal
m("n", "<leader>se", "<C-w>=", opts) -- split equal width
m("n", "<leader>sx", ":close<CR>", opts) -- close current split

-- Buffer navigation
m("n", "<S-l>", ":bnext<CR>", opts)
m("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear search highlights
m("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Stay in indent mode when indenting
m("v", "<", "<gv", opts)
m("v", ">", ">gv", opts)

-- File Explorer
m("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
m("n", "<leader>fe", ":NvimTreeFocus<CR>", opts)

-- Trouble
m("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
m("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)
m("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", opts)
m("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", opts)
m("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opts)
m("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", opts)

-- TODO Comments
m("n", "<leader>tt", "<cmd>TodoTrouble<CR>", opts)

-- Neogen
m("n", "<leader>nf", ":Neogen func<CR>", opts)
m("n", "<leader>nc", ":Neogen class<CR>", opts)
m("n", "<leader>nt", ":Neogen type<CR>", opts)
m("n", "<leader>nF", ":Neogen file<CR>", opts)
