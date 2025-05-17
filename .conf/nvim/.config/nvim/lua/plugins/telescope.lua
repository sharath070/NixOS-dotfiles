return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				fzf = {},
			},
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"%.conf*",
					"%.git",
				},
				hidden = true,
				mappings = {
					i = {
						["<C-y>"] = require("telescope.actions").select_default,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		telescope.load_extension("fzf")
		--telescope.load_extension('noice')

		vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files)
		vim.keymap.set("n", "<leader><leader>", require("telescope.builtin").buffers)
		vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>")

		require("config.telescope.multigrep").setup()
	end,
}
