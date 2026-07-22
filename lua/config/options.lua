-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Floating windows (LSP hover, signature help, diagnostics, etc.)
vim.o.winborder = "rounded" -- gives every float a clear border
vim.o.winblend = 0 -- no transparency on floats (kills the "see-through" bleed)
vim.o.pumblend = 0 -- no transparency on the completion menu either
