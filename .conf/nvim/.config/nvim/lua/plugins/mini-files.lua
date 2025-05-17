return {
	"echasnovski/mini.files",
	version = "*",
	config = function()
		require("mini.files").setup({
			mappings = {
				reset = ".",
				synchronize = "<leader>w",
			},
			windows = {
				preview = true,
				width_focus = 30,
				width_nofocus = 15,
				width_preview = 25,
			},
		})

		vim.keymap.set("n", "<leader>e", function()
			--require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
			require("mini.files").open()
		end, { noremap = true, silent = true })
	end,
}
