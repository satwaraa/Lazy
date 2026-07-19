-- Run the current file in a terminal, VSCode "Run Without Debugging" style.
-- Compiled languages are built first; the terminal stays open after the program
-- exits so you can read its output.

-- Where compiled binaries go. Keeping them out of the source tree means running
-- a file never litters the project with executables. (The debugger in dap.lua
-- builds next to the source instead, because codelldb wants a stable path.)
local bindir = vim.fn.stdpath("cache") .. "/run"

-- Shell snippet for one filetype, or nil if we don't know how to run it.
-- `src` is the absolute path of the buffer, already shell-escaped.
local function build_cmd(ft, src)
  local bin = vim.fn.shellescape(bindir .. "/" .. vim.fn.expand("%:t:r"))

  local recipes = {
    -- No -Wall here on purpose: this is the "just run it" path, so the terminal
    -- should show your program's output, not compiler advice. The LSP (clangd)
    -- already surfaces diagnostics inline while you type.
    cpp = "g++ -std=c++20 -O2 " .. src .. " -o " .. bin .. " && " .. bin,
    c = "gcc -std=c17 -O2 " .. src .. " -o " .. bin .. " && " .. bin,
    rust = "rustc -O " .. src .. " -o " .. bin .. " && " .. bin,
    go = "go run " .. src,
    python = "python3 " .. src,
    javascript = "node " .. src,
    typescript = "npx tsx " .. src,
    lua = "nvim -l " .. src,
    sh = "sh " .. src,
    zsh = "zsh " .. src,
    bash = "bash " .. src,
    java = "java " .. src, -- single-file source mode (JDK 11+)
  }

  return recipes[ft]
end

local function run_current_file()
  local ft = vim.bo.filetype
  local src = vim.fn.shellescape(vim.fn.expand("%:p"))

  if vim.fn.expand("%") == "" then
    return vim.notify("Buffer has no file on disk", vim.log.levels.WARN, { title = "Run" })
  end

  local recipe = build_cmd(ft, src)
  if not recipe then
    return vim.notify("No run recipe for filetype '" .. ft .. "'", vim.log.levels.WARN, { title = "Run" })
  end

  vim.cmd("silent! write")
  vim.fn.mkdir(bindir, "p")

  -- Run from the file's own directory so relative paths in the program (the
  -- usual `input.txt` / `freopen` pattern) resolve the way you'd expect.
  local dir = vim.fn.shellescape(vim.fn.expand("%:p:h"))

  -- Hold the terminal open after exit: without this the window closes the
  -- instant the program finishes and the output is gone.
  local cmd = table.concat({
    "cd " .. dir,
    "(" .. recipe .. ")",
    -- Not `status`: that name is read-only in zsh (it aliases $?) and assigning
    -- to it aborts the line, masking the program's real exit code.
    "run_ec=$?",
    'printf "\\n[exited %s] press ENTER to close..." "$run_ec"',
    "read _",
  }, "; ")

  Snacks.terminal.open(cmd, {
    interactive = true,
    win = {
      position = "float",
      width = 0.85,
      height = 0.8,
      border = "rounded",
      title = " Run: " .. vim.fn.expand("%:t") .. " ",
      title_pos = "center",
    },
  })
end

return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<C-A-n>", run_current_file, desc = "Run current file", mode = { "n", "i" } },
      { "<leader>rr", run_current_file, desc = "Run current file" },
    },
  },
}
