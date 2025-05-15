vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr><esc>")
vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")

-- diagnostic keymaps
-- vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'open diagnostic [q]uickfix list' })

-- exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. otherwise, you normally need to press <c-\><c-n>, which
-- is not what someone will guess without a bit more experience.
--
-- note: this won't work in all terminal emulators/tmux/etc. try your own mapping
-- or just use <c-\><c-n> to exit terminal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "exit terminal mode" })

-- keybinds to make split navigation easier.
--  use ctrl+<hjkl> to switch between windows
--
--  see `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<c-h>", "<c-w><c-h>", { desc = "move focus to the left window" })
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", { desc = "move focus to the right window" })
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", { desc = "move focus to the lower window" })
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", { desc = "move focus to the upper window" })

-- note: some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<c-s-h>", "<c-w>h", { desc = "move window to the left" })
-- vim.keymap.set("n", "<c-s-l>", "<c-w>l", { desc = "move window to the right" })
-- vim.keymap.set("n", "<c-s-j>", "<c-w>j", { desc = "move window to the lower" })
-- vim.keymap.set("n", "<c-s-k>", "<c-w>k", { desc = "move window to the upper" })

vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<cr>", { desc = "Dismiss noice notifications" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true })
