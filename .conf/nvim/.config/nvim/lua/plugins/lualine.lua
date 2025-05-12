return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        --section_separators = { left = '', right = '' },
        --component_separators = { left = '', right = '' },
        --component_separators = { left = '', right = '' }
      },
    })
  end,
}
