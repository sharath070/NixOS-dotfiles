return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = {
					"gopls",
					"ts_ls",
					"lua_ls",
					"eslint",
					"html",
					"cssls",
					"jsonls",
				},
				automatic_installation = false
			}

			require("mason-lspconfig").setup_handlers {
				function(server_name)
					require("lspconfig")[server_name].setup {}
				end,
			}
		end
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			vim.diagnostic.config({
				float = { border = 'rounded' }
			})

			require "lspconfig.ui.windows".default_options.border = "rounded"

			-- autformat on save
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(event_ctx)
					local client = vim.lsp.get_client_by_id(event_ctx.data.client_id)
					if not client then return end

					local opts = { buffer = event_ctx.buf, noremap = true, silent = true }
					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover { border = "rounded" }
					end, opts)
					vim.keymap.set("i", "<C-k>", function()
						vim.lsp.buf.signature_help { border = "rounded" }
					end, opts)

					if client.supports_method('textDocument/formatting') then
						vim.api.nvim_create_autocmd('BufWritePre', {
							buffer = event_ctx.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = event_ctx.buf, id = client.id })
							end,
						})
					end
				end,
			})
		end
	},
}
