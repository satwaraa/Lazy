return {
  -- persistence.nvim (bundled with LazyVim) saves the open files/windows/layout
  -- per working directory. By default you restore with <leader>qs; this makes it
  -- restore automatically when you launch nvim in a directory with no file args.
  {
    "folke/persistence.nvim",
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("auto_restore_session", { clear = true }),
        nested = true,
        callback = function()
          -- Only auto-restore for a bare `nvim` (no file passed) and when not
          -- piping input in. Opening `nvim file.cpp` won't clobber your session.
          if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
            require("persistence").load()
          end
        end,
      })
      vim.api.nvim_create_autocmd("StdinReadPre", {
        callback = function()
          vim.g.started_with_stdin = true
        end,
      })
    end,
  },
}
