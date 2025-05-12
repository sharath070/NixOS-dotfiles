return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				go = { "goimports", "gofmt" },
			},
			formatters = {
				prettier = {
					-- This ensures project config files like .prettierrc are respected
					prepend_args = { "--config-precedence", "prefer-file" },
				},
			},
			format_on_save = { async = false, timeout_ms = 10000 },
		})
	end,
}
