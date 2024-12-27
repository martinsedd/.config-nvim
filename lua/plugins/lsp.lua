return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "hrsh7th/cmp-nvim-lsp", dependencies = { "hrsh7th/nvim-cmp" }, lazy = false },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = function(client, bufnr)
				-- Disable LSP formatting
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				local opts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
				automatic_installation = true,
			})

			-- Lua LSP settings
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			-- Vim/Vimdoc LSP (vimls)
			require("lspconfig").vimls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Typescript/Javascript LSP (ts_ls)
			require("lspconfig").ts_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Python LSP (pyright)
			require("lspconfig").pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- Go LSP (gopls)
			require("lspconfig").gopls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- Java LSP (jdtls)
			require("lspconfig").jdtls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- SQL LSP (sqlls)
			require("lspconfig").sqlls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- JSON LSP (jsonls)
			require("lspconfig").jsonls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- YAML LSP (yamlls)
			require("lspconfig").yamlls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- Markdown/Markdown-Inline (marksman)
			require("lspconfig").marksman.setup({
				capabilities = capabilities, -- Ensure capabilities are passed
				on_attach = on_attach, -- Attach your common LSP settings
				ft = "markdown",
			})

			require("lspconfig").pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				ft = "python",
			})

			local signs = {
				{ name = "DiagnosticSignError", text = "" },
				{ name = "DiagnosticSignWarn", text = "" },
				{ name = "DiagnosticSignHint", text = "" },
				{ name = "DiagnosticSignInfo", text = "" },
			}

			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			end

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
