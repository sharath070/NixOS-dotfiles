return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local tdc = require("todo-comments")

		vim.keymap.set("n", "]t", function()
			tdc.jump_next()
		end, { desc = "Next todo comment" })

		vim.keymap.set("n", "[t", function()
			tdc.jump_prev()
		end, { desc = "Previous todo comment" })

		tdc.setup()
	end,
}
