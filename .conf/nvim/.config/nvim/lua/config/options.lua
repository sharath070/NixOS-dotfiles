vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- see `:help vim.opt`
--  for more options, you can see `:help option-list`
local set = vim.opt
set.number = true
set.relativenumber = true
set.tabstop = 4
set.shiftwidth = 4
set.virtualedit = "block"
set.termguicolors = true

-- enable mouse mode, can be useful for resizing splits for example!
set.mouse = "a"

-- don't show the mode, since it's already in the status line
set.showmode = false

-- schedules the clipboard setting to happen later — after neovim finishes starting up
-- the function inside vim.schedule() runs after neovim has finished loading all plugins, ui events, etc.
vim.schedule(function()
	set.clipboard = "unnamedplus"
end)

-- enable break indent
set.breakindent = true

-- save undo history
set.undofile = true

-- case-insensitive searching unless \c or one or more capital letters in the search term
set.ignorecase = true
set.smartcase = true

-- symbols that appear before line nums (the git symbols)
set.signcolumn = "yes"

-- decrease update time
set.updatetime = 250

-- decrease mapped sequence wait time
set.timeoutlen = 300

-- configure how new splits should be opened
set.splitright = true
set.splitbelow = true

-- preview substitutions live, as you type!
set.inccommand = "split"

-- show which line your cursor is on
set.cursorline = true

-- minimal number of screen lines to keep above and below the cursor.
set.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
set.confirm = true

vim.api.nvim_create_autocmd("textyankpost", {
	desc = "highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
