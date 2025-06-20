return {
	enabled = true,

	sources = {
		explorer = {
			layout = { layout = { position = "right" } },
		},
		buffers = {
			layout = { preset = "select" },
		},
		files = {
			exclude = { "node_modules", ".git/", ".conf*", ".misc" },
			hidden = true,
		},
	},
	matcher = { frecency = true },
	win = {
		input = {
			keys = { ["<C-y>"] = { "confirm", mode = { "n", "i" } } },
		},
	},
}
