return {
	enabled = true,

	sources = {
		explorer = {
			layout = { layout = { position = "right" } },
		},
		buffers = {
			layout = { preset = "select" },
		},
	},
	matcher = { frecency = true },
	win = {
		input = {
			keys = { ["<C-y>"] = { "confirm", mode = { "n", "i" } } },
		},
	},
}
