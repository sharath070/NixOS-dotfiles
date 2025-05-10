return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = function()
		require("noice").setup({
			presets = {
				lsp_doc_border = true,
			},
		})
	end,
}
