return {
  -- C/C++ language support: clangd LSP + clang-format (via conform.nvim)
  { import = "lazyvim.plugins.extras.lang.clangd" },

  -- Match the editor's live indentation to the clang-format style (4 spaces)
  {
    "LazyVim/LazyVim",
    opts = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp", "objc", "objcpp" },
        callback = function()
          vim.opt_local.expandtab = true
          vim.opt_local.tabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.softtabstop = 4
        end,
      })
    end,
  },
}
