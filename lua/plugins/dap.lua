-- Compile the current C/C++ file with debug symbols and launch it under codelldb.
-- No menu, no path prompt — VSCode "Debug C++ File" behaviour.
local function debug_current_cpp()
  local dap = require("dap")
  local src = vim.fn.expand("%:p")
  local bin = vim.fn.expand("%:p:r") -- source path minus extension
  vim.cmd("silent! write") -- save before compiling
  local out = vim.fn.system({ "g++", "-g", "-O0", "-std=c++20", src, "-o", bin })
  if vim.v.shell_error ~= 0 then
    vim.notify(out, vim.log.levels.ERROR, { title = "C++ compile failed" })
    return
  end
  dap.run({
    name = "Debug C++ File",
    type = "codelldb",
    request = "launch",
    program = bin,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  })
end

-- Launch the current Go file under delve. No menu, no path prompt — the Go
-- counterpart of debug_current_cpp. There is no explicit compile step here:
-- delve builds the program itself as part of the launch request.
local function debug_current_go()
  local dap = require("dap")
  vim.cmd("silent! write") -- save before delve builds
  dap.run({
    name = "Debug Go File",
    type = "go", -- adapter registered by nvim-dap-go
    request = "launch",
    mode = "debug",
    -- Single file, like the C++ path: `dsa/go/arrays/00.sorting.go`. Sibling
    -- files with their own func main() won't collide. Use "${fileDirname}"
    -- instead if you keep one multi-file main package per directory.
    program = "${file}",
    cwd = "${workspaceFolder}",
  })
end

-- F5 like VSCode: continue if a session is live, otherwise start.
-- For C/C++ and Go "start" means build-and-run the current file; other
-- languages fall back to normal dap.continue() (their own extras provide
-- the config).
local function start_or_continue()
  local dap = require("dap")
  if dap.session() then
    return dap.continue()
  end
  local ft = vim.bo.filetype
  if ft == "cpp" or ft == "c" then
    return debug_current_cpp()
  end
  if ft == "go" then
    return debug_current_go()
  end
  return dap.continue()
end

return {
  -- Core debugging: nvim-dap, dap-ui, virtual text, mason-nvim-dap.
  { import = "lazyvim.plugins.extras.dap.core" },

  -- Auto-install the C/C++/Rust debug adapter via Mason.
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "codelldb" } },
  },

  -- Stop mason-nvim-dap from injecting its generic "LLDB: Launch" configs;
  -- register the adapter only, so the config list stays clean.
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      handlers = {
        codelldb = function(config)
          require("dap").adapters.codelldb = config.adapters
        end,
      },
    },
  },

  -- Bigger Scopes (variables) panel and a wider sidebar.
  {
    "rcarriga/nvim-dap-ui",
    opts = {
      layouts = {
        {
          position = "left",
          size = 50, -- sidebar width in columns (default 40)
          elements = {
            { id = "scopes", size = 0.55 }, -- the Local/Static/Global panel — biggest
            { id = "watches", size = 0.20 },
            { id = "stacks", size = 0.15 },
            { id = "breakpoints", size = 0.10 },
          },
        },
        {
          position = "bottom",
          size = 10, -- console/repl height in rows
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
        },
      },
    },
  },

  -- Persist breakpoints to disk (per project) and auto-restore them on file open.
  {
    "Weissle/persistent-breakpoints.nvim",
    event = "BufReadPost",
    opts = {
      load_breakpoints_event = { "BufReadPost" },
    },
  },

  -- VSCode-style single-key debug shortcuts + codelldb adapter path.
  {
    "mfussenegger/nvim-dap",
    dependencies = { "Weissle/persistent-breakpoints.nvim" },
    keys = {
      { "<F5>", start_or_continue, desc = "Debug: Start/Continue" },
      { "<S-F5>", function() require("dap").terminate() end, desc = "Debug: Stop" },
      { "<C-S-F5>", function() require("dap").restart() end, desc = "Debug: Restart" },
      { "<F6>", function() require("dap").pause() end, desc = "Debug: Pause" },
      -- Toggle via persistent-breakpoints so the breakpoint is saved to disk.
      { "<F9>", function() require("persistent-breakpoints.api").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint (persistent)" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<S-F11>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    },
    opts = function()
      -- Point codelldb at the Mason binary (avoids any $PATH timing issues).
      local codelldb = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
      if vim.fn.executable(codelldb) == 0 then
        codelldb = "codelldb"
      end
      require("dap").adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb,
          args = { "--port", "${port}" },
        },
      }
    end,
  },
}
