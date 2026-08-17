return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    -- Let Ghostty's transparency show through (dayfox/terafox included)
    opts = {
      options = {
        transparent = true,
      },
    },
    config = function(_, opts)
      require("nightfox").setup(opts)
    end,
  },
  {
    "f-person/auto-dark-mode.nvim",
    dependencies = { "EdenEast/nightfox.nvim" },
    lazy = false,
    opts = {
      set_dark_mode = function()
        vim.o.background = "dark"
        vim.cmd("colorscheme default")
        local ok, lualine = pcall(require, "lualine")
        if ok then lualine.refresh() end
      end,
      set_light_mode = function()
        vim.o.background = "light"
        vim.cmd("colorscheme default")
        local ok, lualine = pcall(require, "lualine")
        if ok then lualine.refresh() end
      end,
      update_interval = 3000,
      fallback = "dark",
    },
  },
}
