-- Custom colorscheme with Ayu-inspired colors and #070F19 background
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "custom"
vim.o.termguicolors = true

local bg = "#070F19"

-- Ayu Dark color palette
local colors = {
  bg = bg,
  fg = "#BFBDB6",
  fg_dim = "#565B66",
  comment = "#626A73",
  keyword = "#FF8F40",
  string = "#AAD94C",
  func = "#FFB454",
  type = "#59C2FF",
  constant = "#D2A6FF",
  number = "#E6B450",
  operator = "#F29668",
  error = "#D95757",
  warning = "#E6B450",
  info = "#59C2FF",
  hint = "#95E6CB",
  accent = "#E6B450",
  selection = "#1A2633",
  line = "#0D1520",
  gutter = "#3D424D",
}

-- Editor UI
vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "NormalNC", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "NormalSB", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "SignColumn", { bg = colors.bg })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = colors.bg, bg = colors.bg })
vim.api.nvim_set_hl(0, "FoldColumn", { fg = colors.gutter, bg = colors.bg })
vim.api.nvim_set_hl(0, "Folded", { fg = colors.comment, bg = colors.line })
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.gutter, bg = colors.bg })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.accent, bg = colors.line, bold = true })
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.line })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = colors.line })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = colors.line })
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.selection, bg = colors.bg })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.selection, bg = colors.bg })
vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.fg, bg = colors.line })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.comment, bg = colors.line })
vim.api.nvim_set_hl(0, "TabLine", { fg = colors.comment, bg = colors.line })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = colors.bg })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "MsgArea", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.fg, bg = colors.selection })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.bg, bg = colors.accent })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.selection })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.gutter })
vim.api.nvim_set_hl(0, "Visual", { bg = colors.selection })
vim.api.nvim_set_hl(0, "VisualNOS", { bg = colors.selection })
vim.api.nvim_set_hl(0, "Search", { fg = colors.bg, bg = colors.accent })
vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.bg, bg = colors.keyword })
vim.api.nvim_set_hl(0, "MatchParen", { fg = colors.accent, bold = true, underline = true })
vim.api.nvim_set_hl(0, "Cursor", { fg = colors.bg, bg = colors.fg })
vim.api.nvim_set_hl(0, "lCursor", { fg = colors.bg, bg = colors.fg })
vim.api.nvim_set_hl(0, "CursorIM", { fg = colors.bg, bg = colors.fg })
vim.api.nvim_set_hl(0, "TermCursor", { fg = colors.bg, bg = colors.fg })
vim.api.nvim_set_hl(0, "TermCursorNC", { fg = colors.bg, bg = colors.comment })

-- Syntax highlighting
vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, "Constant", { fg = colors.constant })
vim.api.nvim_set_hl(0, "String", { fg = colors.string })
vim.api.nvim_set_hl(0, "Character", { fg = colors.string })
vim.api.nvim_set_hl(0, "Number", { fg = colors.number })
vim.api.nvim_set_hl(0, "Boolean", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Float", { fg = colors.number })
vim.api.nvim_set_hl(0, "Identifier", { fg = colors.fg })
vim.api.nvim_set_hl(0, "Function", { fg = colors.func })
vim.api.nvim_set_hl(0, "Statement", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Conditional", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Repeat", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Label", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Operator", { fg = colors.operator })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Exception", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "PreProc", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Include", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Define", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Macro", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "PreCondit", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Type", { fg = colors.type })
vim.api.nvim_set_hl(0, "StorageClass", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Structure", { fg = colors.type })
vim.api.nvim_set_hl(0, "Typedef", { fg = colors.type })
vim.api.nvim_set_hl(0, "Special", { fg = colors.operator })
vim.api.nvim_set_hl(0, "SpecialChar", { fg = colors.operator })
vim.api.nvim_set_hl(0, "Tag", { fg = colors.type })
vim.api.nvim_set_hl(0, "Delimiter", { fg = colors.fg_dim })
vim.api.nvim_set_hl(0, "SpecialComment", { fg = colors.comment })
vim.api.nvim_set_hl(0, "Debug", { fg = colors.error })
vim.api.nvim_set_hl(0, "Underlined", { underline = true })
vim.api.nvim_set_hl(0, "Error", { fg = colors.error })
vim.api.nvim_set_hl(0, "Todo", { fg = colors.accent, bold = true })

-- Treesitter
vim.api.nvim_set_hl(0, "@variable", { fg = colors.fg })
vim.api.nvim_set_hl(0, "@variable.builtin", { fg = colors.constant })
vim.api.nvim_set_hl(0, "@variable.parameter", { fg = colors.fg })
vim.api.nvim_set_hl(0, "@variable.member", { fg = colors.fg })
vim.api.nvim_set_hl(0, "@constant", { fg = colors.constant })
vim.api.nvim_set_hl(0, "@constant.builtin", { fg = colors.constant })
vim.api.nvim_set_hl(0, "@constant.macro", { fg = colors.constant })
vim.api.nvim_set_hl(0, "@module", { fg = colors.fg })
vim.api.nvim_set_hl(0, "@label", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@string", { fg = colors.string })
vim.api.nvim_set_hl(0, "@string.escape", { fg = colors.operator })
vim.api.nvim_set_hl(0, "@string.special", { fg = colors.operator })
vim.api.nvim_set_hl(0, "@character", { fg = colors.string })
vim.api.nvim_set_hl(0, "@number", { fg = colors.number })
vim.api.nvim_set_hl(0, "@boolean", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@float", { fg = colors.number })
vim.api.nvim_set_hl(0, "@function", { fg = colors.func })
vim.api.nvim_set_hl(0, "@function.builtin", { fg = colors.func })
vim.api.nvim_set_hl(0, "@function.call", { fg = colors.func })
vim.api.nvim_set_hl(0, "@function.macro", { fg = colors.func })
vim.api.nvim_set_hl(0, "@method", { fg = colors.func })
vim.api.nvim_set_hl(0, "@method.call", { fg = colors.func })
vim.api.nvim_set_hl(0, "@constructor", { fg = colors.type })
vim.api.nvim_set_hl(0, "@parameter", { fg = colors.fg })
vim.api.nvim_set_hl(0, "@keyword", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@keyword.function", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@keyword.operator", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@keyword.return", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@conditional", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@repeat", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@exception", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@include", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@operator", { fg = colors.operator })
vim.api.nvim_set_hl(0, "@type", { fg = colors.type })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.type })
vim.api.nvim_set_hl(0, "@type.definition", { fg = colors.type })
vim.api.nvim_set_hl(0, "@type.qualifier", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@namespace", { fg = colors.fg })
vim.api.nvim_set_hl(0, "@attribute", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "@property", { fg = colors.fg })
vim.api.nvim_set_hl(0, "@field", { fg = colors.fg })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = colors.fg_dim })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = colors.fg_dim })
vim.api.nvim_set_hl(0, "@punctuation.special", { fg = colors.operator })
vim.api.nvim_set_hl(0, "@comment", { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, "@tag", { fg = colors.type })
vim.api.nvim_set_hl(0, "@tag.attribute", { fg = colors.func })
vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = colors.fg_dim })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.error })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.warning })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.info })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.hint })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warning })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.hint })

-- Git
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.string })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.accent })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.error })
vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1D3B2F" })
vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2E3C43" })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3B2230" })
vim.api.nvim_set_hl(0, "DiffText", { bg = "#3B4D56" })

-- Neo-tree
vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = colors.bg, bg = colors.bg })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = colors.accent })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = colors.type })
vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = colors.fg })
vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = colors.string })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = colors.accent })
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = colors.error })

-- Snacks Dashboard
vim.api.nvim_set_hl(0, "SnacksDashboardNormal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = colors.type, bg = colors.bg })
vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = colors.keyword, bg = colors.bg })
vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = colors.string, bg = colors.bg })
vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = colors.type, bg = colors.bg })
vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = colors.accent, bg = colors.bg })
vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = colors.func, bg = colors.bg })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.gutter, bg = colors.bg })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.selection })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.selection, bg = colors.selection })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.bg, bg = colors.keyword })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.bg, bg = colors.string })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.bg, bg = colors.type })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.selection })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.accent, bold = true })

-- WhichKey
vim.api.nvim_set_hl(0, "WhichKey", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = colors.type })
vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = colors.fg })
vim.api.nvim_set_hl(0, "WhichKeySeperator", { fg = colors.comment })
vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = colors.bg })

-- Indent guides
vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = colors.selection })
vim.api.nvim_set_hl(0, "IblIndent", { fg = colors.selection })
vim.api.nvim_set_hl(0, "IblScope", { fg = colors.gutter })

-- Bufferline
vim.api.nvim_set_hl(0, "BufferLineBackground", { fg = colors.comment, bg = colors.line })
vim.api.nvim_set_hl(0, "BufferLineFill", { bg = colors.bg })
vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = colors.fg, bg = colors.bg, bold = true })
vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = colors.accent, bg = colors.bg })
