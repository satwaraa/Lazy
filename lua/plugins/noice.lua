return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = { enabled = true },
        signature = { enabled = true },
      },
      presets = {
        -- adds a rounded border + padding to the LSP hover/signature docs
        lsp_doc_border = true,
      },
    },
  },
}
