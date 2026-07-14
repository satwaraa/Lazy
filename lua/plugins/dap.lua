return {
  -- Core debugging: nvim-dap, dap-ui, virtual text, mason-nvim-dap.
  -- This gives you the <leader>d... keymaps and the debug UI for ALL languages.
  { import = "lazyvim.plugins.extras.dap.core" },

  -- Auto-install the C/C++/Rust debug adapter via Mason.
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "codelldb" } },
  },

  -- Register codelldb as the adapter for c, cpp, and rust, plus a default
  -- "launch" configuration that asks which executable to debug.
  {
    "mfussenegger/nvim-dap",
    -- VSCode-style single-key debug shortcuts (added on top of LazyVim's <leader>d... keys).
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
      { "<S-F5>", function() require("dap").terminate() end, desc = "Debug: Stop" },
      { "<C-S-F5>", function() require("dap").restart() end, desc = "Debug: Restart" },
      { "<F6>", function() require("dap").pause() end, desc = "Debug: Pause" },
      { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<S-F11>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    },
    opts = function()
      local dap = require("dap")

      -- Resolve codelldb from Mason's bin, falling back to $PATH.
      local codelldb = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
      if vim.fn.executable(codelldb) == 0 then
        codelldb = "codelldb"
      end

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb,
          args = { "--port", "${port}" },
        },
      }

      local cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.cpp = cpp
      dap.configurations.c = cpp
      dap.configurations.rust = cpp
    end,
  },
}
