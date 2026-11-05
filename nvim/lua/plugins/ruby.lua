return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- mason=false keeps ruby-lsp out of mason/bin, which prepends itself to PATH
        -- with a RubyGems shebang pinned to whichever mise ruby was active at install
        -- time. Resolving from PATH instead lets mise pick each app's ruby.
        ruby_lsp = { mason = false },
        rubocop = { enabled = false },
        standardrb = { enabled = false },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ruby = {},
        eruby = {},
      },
    },
  },
}
