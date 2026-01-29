-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
vim.keymap.set("v", "<C-/>", "gc", { remap = true })

-- Toggle terminal with Ctrl + `
vim.keymap.set("n", "<C-`>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
vim.keymap.set("t", "<C-`>", "<cmd>close<CR>", { desc = "Hide Terminal" })

-- Duplicate line down with Ctrl + Alt + D
vim.keymap.set("n", "<C-A-d>", ":t.<CR>", { desc = "Duplicate line down" })
vim.keymap.set("v", "<C-A-d>", ":t'><CR>gv", { desc = "Duplicate selection down" })

-- Close buffer with Ctrl + W
vim.keymap.set("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close buffer" })