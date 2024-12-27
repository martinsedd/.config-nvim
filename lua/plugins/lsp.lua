-- LSP configuration module
local M = {
	-- Core LSP plugins
	{
		"kosayoda/nvim-lightbulb",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("nvim-lightbulb").setup({
				autocmd = { enabled = true },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "hrsh7th/cmp-nvim-lsp", dependencies = { "hrsh7th/nvim-cmp" }, lazy = false },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Common LSP keybindings setup
			local function on_attach(client, bufnr)
				-- Disable LSP formatting (handled by null-ls/conform)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				local opts = { noremap = true, silent = true, buffer = bufnr }
				local keymap = vim.keymap.set

				-- Navigation
				keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = bufnr })
				keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr })
				keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })
				keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to references", buffer = bufnr })

				-- Information
				keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover information", buffer = bufnr })
				keymap("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = bufnr })

				-- Code modification
				keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr })
				keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions", buffer = bufnr })
				keymap("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, { desc = "Format buffer", buffer = bufnr })
			end

			-- Mason setup
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "ts_ls", "gopls", "jsonls", "yamlls" },
				automatic_installation = true,
			})

			-- LSP server configurations
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
							telemetry = { enable = false },
						},
					},
				},
				ts_ls = {},
				pyright = {},
				gopls = {},
				jsonls = {},
				yamlls = {},
				marksman = {},
				sqlls = {},
			}

			-- Set up all servers
			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end

			-- Diagnostic signs
			local signs = {
				{ name = "DiagnosticSignError", text = "✘" },
				{ name = "DiagnosticSignWarn", text = "▲" },
				{ name = "DiagnosticSignHint", text = "⚑" },
				{ name = "DiagnosticSignInfo", text = "ℹ" },
			}

			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			end

			-- Diagnostic configuration
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					border = "rounded",
					source = true,
					header = "",
					prefix = "",
				},
			})
		end,
	},
}

return M
