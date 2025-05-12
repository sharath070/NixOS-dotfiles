return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
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

			lspconfig.ts_ls.setup({})

			vim.diagnostic.config({
				float = { border = "rounded" },
			})

			require("lspconfig.ui.windows").default_options.border = "rounded"

			-- autformat on save
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event_ctx)
					local client = vim.lsp.get_client_by_id(event_ctx.data.client_id)
					if not client then
						return
					end

					local opts = { buffer = event_ctx.buf, noremap = true, silent = true }

					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover({ border = "rounded" })
					end, opts)

					vim.keymap.set("i", "<C-k>", function()
						vim.lsp.buf.signature_help({ border = "rounded" })
					end, opts)
				end,
			})
		end,
	},
}
