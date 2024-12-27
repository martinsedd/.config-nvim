-- LSP configuration module
local M = {
	-- Core LSP plugins
	{
		"kosayoda/nvim-lightbulb",
		dependencies = { "nvim-lspconfig" },
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
				keymap("n", "gD", vim.lsp.buf.declaration, opts)
				keymap("n", "gd", vim.lsp.buf.definition, opts)
				keymap("n", "gi", vim.lsp.buf.implementation, opts)
				keymap("n", "gr", vim.lsp.buf.references, opts)

				-- Information
				keymap("n", "K", vim.lsp.buf.hover, opts)
				keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)

				-- Code modification
				keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, { buffer = bufnr, desc = "Code actions" })
				keymap("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end

			-- Mason setup
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
				automatic_installation = true,
			})

			-- LSP server configurations
			local servers = {
				-- Lua
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
				-- Standard configs
				vimls = {}, -- Vim/Vimdoc
				ts_ls = {}, -- TypeScript/JavaScript
				pyright = {}, -- Python
				gopls = {}, -- Go
				jdtls = {}, -- Java
				sqlls = {}, -- SQL
				jsonls = {}, -- JSON
				yamlls = {}, -- YAML
				marksman = {}, -- Markdown
			}

			-- Set up all servers
			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end

			-- Diagnostic signs
			local signs = {
				{ name = "DiagnosticSignError", text = "" },
				{ name = "DiagnosticSignWarn", text = "" },
				{ name = "DiagnosticSignHint", text = "" },
				{ name = "DiagnosticSignInfo", text = "" },
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
