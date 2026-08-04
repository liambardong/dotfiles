-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Match your VSCode whitespace management
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Trim trailing whitespace (with exceptions)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Skip trimming for plaintext files (matches your VSCode config)
    if vim.bo.filetype ~= "text" then
      vim.cmd([[%s/\s\+$//e]])
    end
  end,
})

-- include ruby lsp
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"

-- Insert final newline
vim.opt.fixendofline = true

-- Format on save (handled by conform.nvim above)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    require("conform").format({ async = false, lsp_fallback = true })
  end,
})
