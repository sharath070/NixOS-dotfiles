local map = vim.keymap.set

map("n", "<esc>", "<cmd>nohlsearch<cr><esc>")
map("n", "<leader>w", "<cmd>w!<cr>")
map("n", "<C-s>", "<cmd>wa<cr>")
map("n", "<leader>q", "<cmd>q<cr>")

map("n", "<C-j>", "<cmd>cnext<CR>zz")
map("n", "<C-k>", "<cmd>cprev<CR>zz")

-- diagnostic keymaps
-- map('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'open diagnostic [q]uickfix list' })

-- exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. otherwise, you normally need to press <c-\><c-n>, which
-- is not what someone will guess without a bit more experience.
--
-- note: this won't work in all terminal emulators/tmux/etc. try your own mapping
-- or just use <c-\><c-n> to exit terminal mode
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "exit terminal mode" })

-- keybinds to make split navigation easier.
--  use ctrl+<hjkl> to switch between windows
--
--  see `:help wincmd` for a list of all window commands
map("n", "<c-h>", "<c-w><c-h>", { desc = "move focus to the left window" })
map("n", "<c-l>", "<c-w><c-l>", { desc = "move focus to the right window" })
map("n", "<c-j>", "<c-w><c-j>", { desc = "move focus to the lower window" })
map("n", "<c-k>", "<c-w><c-k>", { desc = "move focus to the upper window" })

-- note: some terminals have colliding keymaps or are not able to send distinct keycodes
-- map("n", "<c-s-h>", "<c-w>h", { desc = "move window to the left" })
-- map("n", "<c-s-l>", "<c-w>l", { desc = "move window to the right" })
-- map("n", "<c-s-j>", "<c-w>j", { desc = "move window to the lower" })
-- map("n", "<c-s-k>", "<c-w>k", { desc = "move window to the upper" })

map("n", "<leader>nd", "<cmd>NoiceDismiss<cr>", { desc = "Dismiss noice notifications" })
map("i", "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true })

map("n", "L", "<cmd>bnext<CR>", { noremap = true, silent = true }) -- Go to next buffer
map("n", "H", "<cmd>bprevious<CR>", { noremap = true, silent = true }) -- Go to previous buffer
map("n", "<C-x>", "<cmd>bd<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local opts = { noremap = true, silent = true, buffer = bufnr }

		map("n", "<leader>gd", vim.lsp.buf.definition, opts)
		map("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
		map("n", "K", vim.lsp.buf.hover, opts)
		map("n", "<leader>rn", vim.lsp.buf.rename, opts)
		map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		map("n", "[d", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)
		map("n", "]d", function()
			vim.diagnostic.jump({})
		end, opts)

		map("n", "gi", "<cmd>Telescope lsp_references<CR>", opts)
	end,
})
