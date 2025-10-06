-- Configure Snacks.nvim to show dotfiles and hidden files
return {
  "folke/snacks.nvim",
  opts = {
    -- Configure the file explorer (dashboard/picker)
    dashboard = {
      preset = {
        pick = function()
          -- When using file picker from dashboard, include hidden files
          require("snacks").picker.files({ hidden = true })
        end,
      },
    },
    -- Configure file picker to show dotfiles by default
    picker = {
      hidden = true, -- Show hidden/dotfiles in file picker
      -- You can also configure specific pickers
      sources = {
        files = {
          hidden = true, -- Show dotfiles in file searches
        },
        grep = {
          hidden = true, -- Search inside dotfiles
        },
      },
    },
  },
}
