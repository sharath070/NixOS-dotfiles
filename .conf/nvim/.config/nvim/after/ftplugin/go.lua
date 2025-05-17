local set = vim.opt_local
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.autoindent = true

vim.keymap.set("n", "<leader>jt", "<cmd>GoTagAdd json<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>yt", "<cmd>GoTagAdd yaml<CR>", { noremap = true, silent = true })
