-- set-theme rewrites these two lines
local light_scheme = "onedark-light"
local dark_scheme = "onedark-dark"

local function apply(background, scheme)
  vim.o.background = background
  local style = scheme:match("^onedark%-(%a+)$")
  if style then
    require("onedark").setup({ style = style, transparent = true })
    require("onedark").load()
  else
    vim.cmd.colorscheme(scheme)
  end
  pcall(function() require("lualine").refresh() end)
end

return {
  -- LazyVim defaults to tokyonight on startup, which would override auto-dark-mode
  { "LazyVim/LazyVim", opts = { colorscheme = function() end } },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true,
      },
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    dependencies = { "folke/tokyonight.nvim" },
    lazy = false,
    opts = {
      set_dark_mode = function() apply("dark", dark_scheme) end,
      set_light_mode = function() apply("light", light_scheme) end,
      update_interval = 3000,
      fallback = "dark",
    },
  },
}
