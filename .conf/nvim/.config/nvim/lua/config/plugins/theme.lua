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
  -- "catppuccin/nvim",
  -- name = "catppuccin",
  -- priority = 1000,
  -- config = function()
  --  vim.cmd.colorscheme "catppuccin-mocha"
  -- end
}
