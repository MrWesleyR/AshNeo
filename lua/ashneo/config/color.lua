-- lua/themes/gotham_blue.lua

local M = {}

local colors = {
  bg        = "#0c1014",
  bg_alt    = "#10151b",
  fg        = "#8da6c1",
  comment   = "#4c5c68",
  red       = "#c23127",
  orange    = "#d26937",
  yellow    = "#e5c07b",
  green     = "#5d9e8f",
  blue      = "#3b6ea8",
  magenta   = "#6e7dab",
  cyan      = "#4d9ccf",
  white     = "#dcdfe4",
  black     = "#0a0f14",
  visual    = "#292e42",
	cursor    = "#2c313c",
  none      = "NONE",
}

function M.setup()
  local function safe_hi(group, opts)
    pcall(vim.api.nvim_set_hl, 0, group, opts)
  end

  local highlights = {
    -- Base UI
    Normal        = { fg = colors.fg, bg = colors.none },
    NormalNC      = { fg = colors.fg, bg = colors.none },
    SignColumn    = { bg = colors.none },
    EndOfBuffer   = { fg = colors.bg_alt, bg = colors.none },
    CursorLine    = { bg = colors.cursor, blend = 0 },
    CursorColumn  = { bg = colors.bg_alt, fg = colors.fg },
    Visual        = { bg = colors.visual },
    LineNr        = { fg = colors.comment },
    CursorLineNr  = { fg = colors.cyan, bold = true },
    VertSplit     = { fg = colors.bg_alt },
    StatusLine    = { fg = colors.fg, bg = colors.bg_alt },
    FloatBorder   = { fg = colors.blue, bg = colors.none },
    NormalFloat   = { fg = colors.fg, bg = colors.none },
    Pmenu         = { fg = colors.fg, bg = colors.bg_alt },
    PmenuSel      = { bg = colors.bg, fg = colors.cyan },
    MatchParen    = { bg = colors.bg_alt },

    -- Syntax
    Comment       = { fg = colors.comment, italic = true },
    Identifier    = { fg = colors.cyan },
    Function      = { fg = colors.blue },
    Statement     = { fg = colors.magenta },
    Keyword       = { fg = colors.magenta, italic = true },
    Type          = { fg = colors.blue },
    String        = { fg = colors.green },
    Number        = { fg = colors.cyan },
    Constant      = { fg = colors.cyan },
    Operator      = { fg = colors.white },
    PreProc       = { fg = colors.magenta },

    -- Tree-sitter legacy
    ["@variable"]     = { fg = colors.fg },
    ["@function"]     = { fg = colors.blue },
    ["@constant"]     = { fg = colors.cyan },
    ["@keyword"]      = { fg = colors.magenta },
    ["@type"]         = { fg = colors.blue },
    ["@string"]       = { fg = colors.green },
    ["@number"]       = { fg = colors.cyan },

    -- LSP / Diagnostic
    DiagnosticError             = { fg = colors.red },
    DiagnosticWarn              = { fg = colors.yellow },
    DiagnosticInfo              = { fg = colors.blue },
    DiagnosticHint              = { fg = colors.cyan },
    DiagnosticUnderlineError    = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineWarn     = { undercurl = true, sp = colors.yellow },
    DiagnosticUnderlineInfo     = { undercurl = true, sp = colors.blue },
    DiagnosticUnderlineHint     = { undercurl = true, sp = colors.cyan },
    LspInfoBorder               = { fg = colors.blue, bg = colors.none },
    DiagnosticFloatTitle        = { fg = colors.blue, bg = colors.none },

    -- Telescope
    TelescopeNormal       = { bg = colors.bg },
    TelescopeBorder       = { fg = colors.bg_alt, bg = colors.bg },
    TelescopePromptTitle  = { fg = colors.blue },
    TelescopeResultsTitle = { fg = colors.magenta },
    TelescopePreviewTitle = { fg = colors.green },

    -- Neo-tree
    NeoTreeNormal          = { fg = colors.fg, bg = colors.none },
    NeoTreeNormalNC        = { fg = colors.fg, bg = colors.none },
    NeoTreeWinSeparator    = { fg = colors.bg_alt, bg = colors.none },
    NeoTreeDirectoryName   = { fg = colors.blue },
    NeoTreeDirectoryIcon   = { fg = colors.blue },
    NeoTreeRootName        = { fg = colors.magenta, bold = true },
    NeoTreeSymbolicLinkTarget = { fg = colors.cyan },
    NeoTreeFileName        = { fg = colors.fg },
    NeoTreeFileNameOpened  = { fg = colors.white, bold = true },
    NeoTreeHiddenByName    = { fg = colors.comment },
    NeoTreeFilteredByName  = { fg = colors.comment },
    NeoTreeGitAdded        = { fg = colors.green },
    NeoTreeGitDeleted      = { fg = colors.red },
    NeoTreeGitModified     = { fg = colors.yellow },
    NeoTreeGitConflict     = { fg = colors.orange },
    NeoTreeGitUntracked    = { fg = colors.cyan },
    NeoTreeCursorLine      = { bg = colors.bg_alt },
    NeoTreeIndentMarker    = { fg = colors.bg_alt },
    NeoTreeExpander        = { fg = colors.comment },

    -- GitSigns
    GitSignsAdd    = { fg = colors.green },
    GitSignsChange = { fg = colors.yellow },
    GitSignsDelete = { fg = colors.red },

    -- Completion (nvim-cmp)
    CmpItemAbbr           = { fg = colors.fg },
    CmpItemAbbrMatch      = { fg = colors.blue },
    CmpItemAbbrMatchFuzzy = { fg = colors.cyan },
    CmpItemKindFunction   = { fg = colors.green },
    CmpItemKindVariable   = { fg = colors.fg },
    CmpItemKindKeyword    = { fg = colors.magenta },

    -- ToggleTerm
    ToggleTerm        = { bg = colors.none },
    ToggleTermNormal  = { bg = colors.none },
    ToggleTermSign    = { bg = colors.none },
  }

  -- Apply all highlights
  for group, opts in pairs(highlights) do
    safe_hi(group, opts)
  end

  -- Modern Tree-sitter / LSP highlighting links
  local ts_links = {
    ["@lsp.type.variable"] = "@variable",
    ["@lsp.type.function"] = "@function",
    ["@lsp.type.constant"] = "@constant",
    ["@lsp.type.keyword"]  = "@keyword",
    ["@lsp.type.type"]     = "@type",
    ["@lsp.type.string"]   = "@string",
    ["@lsp.type.number"]   = "@number",
  }

  for new_group, old_group in pairs(ts_links) do
    safe_hi(new_group, { link = old_group })
  end
end

return M

