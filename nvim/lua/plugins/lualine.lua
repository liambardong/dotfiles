return {
  -- Keep the wide middle/right part of the statusline transparent so Ghostty's
  -- background shows through, WITHOUT blanking the StatusLine highlight group.
  --
  -- Blanking StatusLine.bg (the obvious approach) breaks light/dark switching:
  -- lualine's `auto` theme derives its c-section background *only* from
  -- StatusLine.bg and falls back to a hardcoded #000000 when it's unset
  -- (lualine/themes/auto.lua), so the bar goes black in both backgrounds.
  --
  -- A theme *function* is re-evaluated on every lualine.setup() -- which lualine
  -- itself triggers on ColorScheme and OptionSet background -- so the palette is
  -- rebuilt from the live colors on each switch, and only `c.bg` is overridden.
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = function()
        local theme = require("lualine.utils.loader").load_theme("auto")
        -- The c section now sits on the terminal background, but its fg was
        -- contrast-tuned against StatusLine.bg (3.45:1 in light mode). Re-derive
        -- it from Normal so it stays readable in both backgrounds (~14:1).
        local normal_fg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).fg
        for _, mode in pairs(theme) do
          if type(mode) == "table" and type(mode.c) == "table" then
            mode.c.bg = "NONE"
            if normal_fg then
              mode.c.fg = string.format("#%06x", normal_fg)
            end
          end
        end
        return theme
      end
    end,
  },
}
