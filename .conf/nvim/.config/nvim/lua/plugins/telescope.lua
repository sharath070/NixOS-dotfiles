return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {},
      },
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "%.conf*",
          "%.git",
        },
        hidden = true,
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    require("telescope").load_extension("fzf")
    --require("telescope").load_extension('noice')

    vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files)
    vim.keymap.set("n", "<leader><leader>", require("telescope.builtin").buffers)
    vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)

    require("config.telescope.multigrep").setup()
  end,
}
