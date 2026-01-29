-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle Comments
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

-- Alternative: Use Ctrl + H and Ctrl + L for buffer navigation
vim.keymap.set("n", "<C-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Move lines up and down with Alt + Up/Down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Delete word with Ctrl + Backspace
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word backward" })
vim.keymap.set("i", "<C-H>", "<C-w>", { desc = "Delete word backward" })
