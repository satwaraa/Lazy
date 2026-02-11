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

-- Undo and Redo in insert mode
vim.keymap.set("i", "<C-u>", "<C-o>u", { desc = "Undo in insert mode" })
vim.keymap.set("i", "<C-r>", "<C-o><C-r>", { desc = "Redo in insert mode" })

-- ============================================
-- PRODUCTIVITY SHORTCUTS
-- ============================================

-- Save file with Ctrl + S (works in all modes)
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Select all with Ctrl + A
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Quick escape from insert mode (double tap j)
vim.keymap.set("i", "jj", "<Esc>", { desc = "Quick escape" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Quick escape" })

-- Clear search highlighting with Escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- ============================================
-- SCROLLING & NAVIGATION
-- ============================================

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- Keep search results centered
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Jump to start/end of line (like Home/End but faster)
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Jump to start of line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Jump to end of line" })

-- ============================================
-- EDITING ENHANCEMENTS
-- ============================================

-- Better indenting (stay in visual mode)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Paste without losing clipboard content (visual mode)
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking (use 'd' to cut, 'x' to just delete)
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete char without yank" })

-- Quick find and replace word under cursor
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- Add blank line above/below without entering insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>k", { desc = "Add blank line below" })
vim.keymap.set("n", "<leader>O", "O<Esc>j", { desc = "Add blank line above" })

-- ============================================
-- WINDOW & SPLIT MANAGEMENT
-- ============================================

-- Quick split windows
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Resize splits with arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })

-- Navigate between splits with Alt + hjkl
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move to top split" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move to right split" })

-- ============================================
-- USEFUL EXTRAS
-- ============================================

-- Join lines without moving cursor
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (cursor stays)" })

-- Quick access to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Quick file actions
vim.keymap.set("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New file" })

-- Toggle word wrap
vim.keymap.set("n", "<leader>uw", "<cmd>set wrap!<CR>", { desc = "Toggle word wrap" })

-- Quick source config (useful when editing neovim config)
vim.keymap.set("n", "<leader>so", "<cmd>source %<CR>", { desc = "Source current file" })
