return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			styles = {
				comments = { italic = true }, -- Disable italics in comments
			},
		})
		vim.cmd.colorscheme("tokyonight-night")
	end,
	-- "rose-pine/neovim",
	-- name = "rose-pine",
	-- config = function()
	-- 	vim.cmd("colorscheme rose-pine")
	-- end,
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd.colorscheme("catppuccin-mocha")
	-- 	require("catppuccin").setup({
	-- 		custom_highlights = function(colors)
	-- 			return {
	-- 				Comment = { fg = colors.flamingo },
	-- 				TabLineSel = { bg = colors.pink },
	-- 				CmpBorder = { fg = colors.surface2 },
	-- 				Pmenu = { bg = colors.none },
	-- 			}
	-- 		end,
	-- 	})
	-- end,
}
