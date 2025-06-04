return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		vim.cmd([[
    highlight link DashboardFooter1 @keyword
    highlight link DashboardFooter2 @function
    ]])

		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
					"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
					"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
					"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
					"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
					"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
					"",
					"",
				},
				center = {
					{
						icon = "   ",
						desc = "Find Files                             ",
						key = "f",
						key_format = " %s",
						action = "Telescope find_files",
					},
					{
						icon = "   ",
						desc = "New File                              ",
						key = "n",
						key_format = " %s",
						action = ":ene | startinsert",
					},
					{
						icon = "   ",
						desc = "Recent Files                           ",
						key = "r",
						key_format = " %s",
						action = "Telescope oldfiles",
					},
					{
						icon = "   ",
						key = "g",
						desc = "Find Text                              ",
						key_format = " %s",
						action = "Telescope live_grep",
					},
					{
						icon = "󰒲   ",
						key = "l",
						key_format = " %s",
						desc = "Lazy                                   ",
						action = ":Lazy",
					},
					{
						icon = "   ",
						desc = "Quit                                   ",
						key = "q",
						key_format = " %s",
						action = ":qa",
					},
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = stats.startuptime and (math.floor(stats.startuptime * 100 + 0.5) / 100) or 0
					return {
						"",
						"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
						"  Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
					}
				end,
				vertical_center = true,
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
