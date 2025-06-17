return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "saghen/blink.cmp" },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local map = vim.keymap.set

		local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = require("blink.cmp").get_lsp_capabilities(lsp_capabilities)

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
		})

		lspconfig.gopls.setup({})

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			filetypes = {
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"javascript",
				"javascriptreact",
				"javascript.jsx",
			},
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
					implementationsCodeLens = {
						enabled = true,
					},
					referencesCodeLens = {
						enabled = true,
					},
					preferences = {
						quoteStyle = "double",
					},
					suggest = {
						completeFunctionCalls = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
					},
				},
			},
			commands = {
				OrganizeImports = {
					function()
						vim.lsp.buf.execute_command({
							command = "_typescript.organizeImports",
							arguments = { vim.api.nvim_buf_get_name(0) },
						})
					end,
					description = "Organize Imports",
				},
			},
		})

		-- Svelte LSP
		local svelte_lsp_capabilities = vim.tbl_deep_extend("force", {}, capabilities)
		svelte_lsp_capabilities.workspace = { didChangeWatchedFiles = false }
		lspconfig.svelte.setup({
			capabilities = svelte_lsp_capabilities,
			filetypes = { "svelte" },
			settings = {
				svelte = {
					plugin = {
						svelte = {
							defaultScriptLanguage = "ts",
						},
					},
				},
			},
		})

		lspconfig.tailwindcss.setup({})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
			callback = function(event)
				local bufnr = event.buf
				local opts = { noremap = true, silent = true, buffer = bufnr }

				map("n", "<leader>gd", vim.lsp.buf.definition, opts)
				map("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
				map("n", "K", vim.lsp.buf.hover, opts)
				map("n", "<leader>rn", vim.lsp.buf.rename, opts)
				map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				map("n", "gl", vim.diagnostic.open_float, opts)
				map("n", "[d", function()
					vim.diagnostic.jump({ count = -1 })
				end, opts)
				map("n", "]d", function()
					vim.diagnostic.jump({})
				end, opts)

				-- all the code in the bottom is to highlight the references
				local highlight_augroup = vim.api.nvim_create_augroup("custom-lsp-highlight", { clear = false })
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})

				vim.api.nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("custom-lsp-detach", { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds({ group = "custom-lsp-highlight", buffer = event2.buf })
					end,
				})
			end,
		})

		require("lspconfig.ui.windows").default_options.border = "rounded"
	end,
}
