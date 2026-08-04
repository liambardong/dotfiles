-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- Exit terminal mode with jk (when focused on a terminal buffer, : goes to shell)
-- Use this to leave terminal before running : commands
vim.keymap.set("t", "jk", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })

-- ── Navigation ──────────────────────────────────────────────────────────────

-- Jump between most recent buffers (like Cmd+Tab for files)
vim.keymap.set("n", "<leader><Tab>", "<C-^>", { desc = "Alternate buffer" })

-- Better up/down on wrapped lines
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Stay centered when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- ── Editing ──────────────────────────────────────────────────────────────────

-- Paste without clobbering the register (great for repeated paste-replace)
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yank" })

-- Delete without clobbering the yank register
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yank" })

-- Yank to system clipboard explicitly
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })

-- ── LSP shortcuts ────────────────────────────────────────────────────────────

-- Quick definition in a vertical split (useful when exploring unfamiliar code)
vim.keymap.set("n", "gvd", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition (vsplit)" })

-- ── Git ──────────────────────────────────────────────────────────────────────

-- Stage/reset individual hunks without opening lazygit
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })

-- ── Quickfix ─────────────────────────────────────────────────────────────────

vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<CR>", { desc = "Open quickfix list" })
