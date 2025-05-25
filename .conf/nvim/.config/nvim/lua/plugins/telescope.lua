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
					"%.conf/",
					"%.config/",
					"%.git/",
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
					follow_gitignore = true, -- Fixed typo: was "follow_gno_ignore"
					no_ignore_parent = true,
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--no-ignore",
						"--glob",
						"!**/.git/*",
						"--glob",
						"!**/node_modules/*",
					},
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
