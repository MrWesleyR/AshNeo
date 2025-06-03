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
  none      = "NONE",
}

function M.setup()
  local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Base UI
	hi("Normal",       { fg = colors.fg, bg = "NONE" })
	hi("NormalNC",     { fg = colors.fg, bg = "NONE" })
	hi("SignColumn",   { bg = "NONE" })
	hi("EndOfBuffer",  { fg = colors.bg_alt, bg = "NONE" })
	hi("CursorLine",   { bg = colors.bg_alt }) -- Mantém leve contraste
  hi("CursorLine",   { bg = colors.bg_alt })
  hi("CursorColumn", { bg = colors.bg_alt })
  hi("Visual",       { bg = "#1b3247" })
  hi("LineNr",       { fg = colors.comment })
  hi("CursorLineNr", { fg = colors.cyan, bold = true })
  hi("VertSplit",    { fg = colors.bg_alt })
  hi("StatusLine",   { fg = colors.fg, bg = colors.bg_alt })
	hi("FloatBorder",  { fg = colors.blue, bg = "NONE" })
	hi("NormalFloat",  { fg = colors.fg, bg = "NONE" })
	hi("Pmenu",        { fg = colors.fg, bg = colors.bg_alt })   -- Menu suspenso: sem transparência total
	hi("PmenuSel",     { bg = colors.bg, fg = colors.cyan })     -- Mantém destaque
  hi("MatchParen",   { bg = colors.bg_alt })

  -- Syntax
  hi("Comment",      { fg = colors.comment, italic = true })
  hi("Identifier",   { fg = colors.cyan })
  hi("Function",     { fg = colors.blue })
  hi("Statement",    { fg = colors.magenta })
  hi("Keyword",      { fg = colors.magenta, italic = true })
  hi("Type",         { fg = colors.blue })
  hi("String",       { fg = colors.green })
  hi("Number",       { fg = colors.cyan })
  hi("Constant",     { fg = colors.cyan })
  hi("Operator",     { fg = colors.white })
  hi("PreProc",      { fg = colors.magenta })

  -- Treesitter
  hi("@variable",     { fg = colors.fg })
  hi("@function",     { fg = colors.blue })
  hi("@constant",     { fg = colors.cyan })
  hi("@keyword",      { fg = colors.magenta })
  hi("@type",         { fg = colors.blue })
  hi("@string",       { fg = colors.green })
  hi("@number",       { fg = colors.cyan })

  -- Diagnostics (LSP)
  hi("DiagnosticError", { fg = colors.red })
  hi("DiagnosticWarn",  { fg = colors.yellow })
  hi("DiagnosticInfo",  { fg = colors.blue })
  hi("DiagnosticHint",  { fg = colors.cyan })
  hi("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
  hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = colors.yellow })
  hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = colors.blue })
  hi("DiagnosticUnderlineHint",  { undercurl = true, sp = colors.cyan })
	hi("LspInfoBorder", { fg = colors.blue, bg = "NONE" })
	hi("DiagnosticFloatTitle", { fg = colors.blue, bg = "NONE" })

  -- Telescope
  hi("TelescopeNormal",        { bg = colors.bg })
  hi("TelescopeBorder",        { fg = colors.bg_alt, bg = colors.bg })
  hi("TelescopePromptTitle",   { fg = colors.blue })
  hi("TelescopeResultsTitle",  { fg = colors.magenta })
  hi("TelescopePreviewTitle",  { fg = colors.green })

	-- Neo-tree (nvim 0.8+)
	hi("NeoTreeNormal",     { fg = colors.fg, bg = "NONE" })
	hi("NeoTreeNormalNC",   { fg = colors.fg, bg = "NONE" })
	hi("NeoTreeWinSeparator", { fg = colors.bg_alt, bg = "NONE" })

	-- Diretórios e arquivos
	hi("NeoTreeDirectoryName",       { fg = colors.blue })
	hi("NeoTreeDirectoryIcon",       { fg = colors.blue })
	hi("NeoTreeRootName",            { fg = colors.magenta, bold = true })
	hi("NeoTreeSymbolicLinkTarget",  { fg = colors.cyan })

	-- Arquivos especiais
	hi("NeoTreeFileName",            { fg = colors.fg })
	hi("NeoTreeFileNameOpened",      { fg = colors.white, bold = true })
	hi("NeoTreeHiddenByName",        { fg = colors.comment })
	hi("NeoTreeFilteredByName",      { fg = colors.comment })

	-- Git
	hi("NeoTreeGitAdded",            { fg = colors.green })
	hi("NeoTreeGitDeleted",          { fg = colors.red })
	hi("NeoTreeGitModified",         { fg = colors.yellow })
	hi("NeoTreeGitConflict",         { fg = colors.orange })
	hi("NeoTreeGitUntracked",        { fg = colors.cyan })

	-- Marcadores e seleção
	hi("NeoTreeCursorLine",          { bg = colors.bg_alt })
	hi("NeoTreeIndentMarker",        { fg = colors.bg_alt })
	hi("NeoTreeExpander",            { fg = colors.comment })

	-- Completion (Cmp)
  hi("CmpItemAbbr",            { fg = colors.fg })
  hi("CmpItemAbbrMatch",       { fg = colors.blue })
  hi("CmpItemAbbrMatchFuzzy",  { fg = colors.cyan })
  hi("CmpItemKindFunction",    { fg = colors.green })
  hi("CmpItemKindVariable",    { fg = colors.fg })
  hi("CmpItemKindKeyword",     { fg = colors.magenta })

  -- GitSigns
  hi("GitSignsAdd",    { fg = colors.green })
  hi("GitSignsChange", { fg = colors.yellow })
  hi("GitSignsDelete", { fg = colors.red })

	-- Transparência para toggleterm
	hi("ToggleTerm", { bg = "NONE" })
	hi("ToggleTermNormal", { bg = "NONE" })
	hi("ToggleTermSign", { bg = "NONE" })

end

return M

