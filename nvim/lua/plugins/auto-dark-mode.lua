return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "f-person/auto-dark-mode.nvim",
    dependencies = { "EdenEast/nightfox.nvim" },
    lazy = false,
    opts = {
      set_dark_mode = function()
        vim.cmd("colorscheme terafox")
      end,
      set_light_mode = function()
        vim.cmd("colorscheme dayfox")
      end,
      update_interval = 3000,
      fallback = "dark",
    },
  },
}
