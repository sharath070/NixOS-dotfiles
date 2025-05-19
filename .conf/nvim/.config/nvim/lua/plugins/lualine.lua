return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
		})
	end,
	-- config = function()
	-- 	require("lualine").setup({
	-- 		options = {
	-- 			icons_enabled = true,
	-- 			section_separators = { left = "", right = "" },
	-- 			component_separators = { left = "", right = "" },
	-- 		},
	-- 		sections = {
	-- 			lualine_a = { { "mode", icon = "" } },
	-- 			lualine_b = {
	-- 				"filename",
	-- 				"diagnostics",
	-- 			},
	-- 			lualine_c = {
	-- 				{
	-- 					"branch",
	-- 					icon = "", -- default is  (nf-oct-git_branch), but you can change it
	-- 				},
	-- 				{
	-- 					"diff",
	-- 					symbols = {
	-- 						added = " ",
	-- 						modified = " ",
	-- 						removed = " ",
	-- 					},
	-- 					colored = true,
	-- 				},
	-- 			},
	-- 		},
	-- 	})
	-- end,
}
