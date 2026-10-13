-- autumn_night.lua
--
-- A 1:1 recreation of the Helix editor "autumn_night" theme for Neovim.
--
-- Source:      https://github.com/helix-editor/helix/blob/master/runtime/themes/autumn_night.toml
-- Inherits:    https://github.com/helix-editor/helix/blob/master/runtime/themes/autumn.toml
--              (autumn_night only overrides the palette; the scope->color
--              mapping below is copied from autumn.toml so every value
--              matches upstream exactly)
--
-- Original Helix theme by Jens Getreu, based on `base16_default_dark`
-- (Ray Gervais), itself derived from the "Autumn" Vim colorscheme
-- (Kenneth Love / Chris Jones / Yorick Peterse).
--
-- Install: copy this file to ~/.config/nvim/colors/autumn_night.lua
-- Use:     :colorscheme autumn_night   (requires termguicolors)

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "autumn_night"

-- ============================================================================
-- Palette (verbatim from autumn_night.toml's [palette] table)
-- ============================================================================
local c = {
  black      = "#111111", -- Cursorline
  brown      = "#cfba8b", -- Member variables, Quotes
  gray0      = "#090909", -- Default Background
  gray1      = "#0e0e0e", -- Ruler
  gray2      = "#1a1a1a", -- Lighter Background (status bars, linenr, folds)
  gray3      = "#404040", -- Selection Background
  gray4      = "#626c66", -- Inlay hint
  gray5      = "#626c66", -- Comments, Invisibles, Line Highlighting
  gray6      = "#aaaaaa", -- Dark Foreground (status bars)
  gray7      = "#c4c4c4", -- Light Foreground
  gray8      = "#e8e8e8", -- Light Background
  green      = "#99be70", -- Strings, Inherited Class, Markup Code, Diff Inserted
  red        = "#f05e48", -- Keywords, Storage, Selector, Diff Changed
  turquoise1 = "#86c1b9", -- Support, Regex, Escape Chars
  turquoise2 = "#72a59e", -- URL
  white1     = "#f3f2cc", -- Default Foreground, Caret, Delimiters, Operators
  white2     = "#f3f2cc", -- Variables, XML Tags, Markup Link Text/Lists, Diff Deleted
  white3     = "#f3f2cc", -- Classes, Markup Bold, Search Text Background
  white4     = "#7e7d6a", -- Secondary cursors / cursor match
  yellow1    = "#fad566", -- Functions, Methods, Attribute IDs, Headings
  yellow2    = "#ffff9f", -- Debug, Info, Warning
  frameline  = "#8b6904", -- Debug frameline (hardcoded, non-palette, in upstream)
  none       = "NONE",
}

local hl = vim.api.nvim_set_hl

-- ============================================================================
-- Editor UI  (maps Helix "ui.*" scopes)
-- ============================================================================
hl(0, "Normal",       { fg = c.white1, bg = c.gray0 })
hl(0, "NormalNC",     { fg = c.white1, bg = c.gray0 })
hl(0, "NormalFloat",  { fg = c.gray7,  bg = c.gray2 })
hl(0, "FloatBorder",  { fg = c.gray3,  bg = c.gray2 })
hl(0, "FloatTitle",   { fg = c.gray7,  bg = c.gray2 })
hl(0, "Cursor",       { fg = c.black,  bg = c.white4 })
hl(0, "lCursor",      { fg = c.black,  bg = c.white4 })
hl(0, "CursorIM",     { fg = c.black,  bg = c.white4 })
hl(0, "CursorLine",   { bg = c.black })
hl(0, "CursorColumn", { bg = c.gray1 })
hl(0, "ColorColumn",  { bg = c.gray1 })
hl(0, "LineNr",       { fg = c.gray3, bg = c.gray0 })
hl(0, "CursorLineNr", { fg = c.gray7, bg = c.gray0, bold = true })
hl(0, "SignColumn",   { fg = c.gray3, bg = c.gray0 })
hl(0, "FoldColumn",   { fg = c.gray3, bg = c.gray0 })
hl(0, "Folded",       { fg = c.gray5, bg = c.gray2 })
hl(0, "StatusLine",   { fg = c.gray7, bg = c.gray2 })
hl(0, "StatusLineNC", { fg = c.gray5, bg = c.gray2 })
hl(0, "WinBar",       { fg = c.gray7, bg = c.gray2 })
hl(0, "WinBarNC",     { fg = c.gray5, bg = c.gray2 })
hl(0, "WinSeparator", { fg = c.gray3, bg = c.gray2 })
hl(0, "VertSplit",    { fg = c.gray3, bg = c.gray2 })
hl(0, "Pmenu",        { fg = c.white1, bg = c.gray2 })
hl(0, "PmenuSel",     { fg = c.gray2,  bg = c.gray6, bold = true })
hl(0, "PmenuSbar",    { bg = c.gray2 })
hl(0, "PmenuThumb",   { bg = c.gray6 })
hl(0, "PmenuKind",    { fg = c.yellow1, bg = c.gray2 })
hl(0, "PmenuKindSel", { fg = c.gray2,   bg = c.gray6 })
hl(0, "Visual",       { bg = c.gray3 })
hl(0, "VisualNOS",    { bg = c.gray3 })
hl(0, "Search",       { fg = c.white1, bg = c.black, bold = true, underline = true })
hl(0, "IncSearch",    { fg = c.white1, bg = c.black, bold = true, underline = true })
hl(0, "CurSearch",    { fg = c.white1, bg = c.black, bold = true, underline = true })
hl(0, "MatchParen",   { fg = c.white1, bg = c.black, bold = true, underline = true })
hl(0, "Directory",    { fg = c.yellow1 })
hl(0, "Title",        { fg = c.yellow1, bold = true })
hl(0, "Question",     { fg = c.yellow1 })
hl(0, "MoreMsg",      { fg = c.yellow1 })
hl(0, "ModeMsg",      { fg = c.white1 })
hl(0, "MsgArea",      { fg = c.white1, bg = c.gray0 })
hl(0, "MsgSeparator", { fg = c.gray3,  bg = c.gray2 })
hl(0, "WarningMsg",   { fg = c.yellow2 })
hl(0, "ErrorMsg",     { fg = c.red })
hl(0, "NonText",      { fg = c.gray4 })
hl(0, "EndOfBuffer",  { fg = c.gray4 })
hl(0, "Whitespace",   { fg = c.gray6 })
hl(0, "SpecialKey",   { fg = c.gray6 })
hl(0, "Conceal",      { fg = c.gray5 })
hl(0, "Substitute",   { fg = c.white1, bg = c.black, bold = true })
hl(0, "QuickFixLine", { bg = c.gray3 })
hl(0, "TabLine",      { fg = c.gray5,  bg = c.gray2 })
hl(0, "TabLineFill",  { bg = c.gray2 })
hl(0, "TabLineSel",   { fg = c.white1, bg = c.gray3 })
hl(0, "WildMenu",     { fg = c.gray2,  bg = c.gray6 })
hl(0, "Debug",        { fg = c.yellow2 })

-- ============================================================================
-- Diagnostics  (maps Helix "diagnostic.*" scopes)
-- ============================================================================
hl(0, "DiagnosticError", { fg = c.red })
hl(0, "DiagnosticWarn",  { fg = c.yellow2 })
hl(0, "DiagnosticInfo",  { fg = c.gray7 })
hl(0, "DiagnosticHint",  { fg = c.gray6 })
hl(0, "DiagnosticOk",    { fg = c.green })
hl(0, "DiagnosticUnderlineError", { sp = c.red,     underline = true })
hl(0, "DiagnosticUnderlineWarn",  { sp = c.yellow2, underline = true })
hl(0, "DiagnosticUnderlineInfo",  { sp = c.gray5,   underline = true })
hl(0, "DiagnosticUnderlineHint",  { sp = c.gray5,   underline = true })
hl(0, "DiagnosticVirtualTextError", { fg = c.red,     bg = c.black })
hl(0, "DiagnosticVirtualTextWarn",  { fg = c.yellow2, bg = c.black })
hl(0, "DiagnosticVirtualTextInfo",  { fg = c.gray7,   bg = c.black })
hl(0, "DiagnosticVirtualTextHint",  { fg = c.gray6,   bg = c.black })
hl(0, "DiagnosticFloatingError", { fg = c.red })
hl(0, "DiagnosticFloatingWarn",  { fg = c.yellow2 })
hl(0, "DiagnosticFloatingInfo",  { fg = c.gray7 })
hl(0, "DiagnosticFloatingHint",  { fg = c.gray6 })
hl(0, "DiagnosticSignError", { fg = c.red })
hl(0, "DiagnosticSignWarn",  { fg = c.yellow2 })
hl(0, "DiagnosticSignInfo",  { fg = c.gray7 })
hl(0, "DiagnosticSignHint",  { fg = c.gray6 })

-- ============================================================================
-- Diff  (maps Helix "diff.*" scopes)
-- ============================================================================
hl(0, "DiffAdd",    { fg = c.green })
hl(0, "DiffDelete", { fg = c.red })
hl(0, "DiffChange", { fg = c.gray5 })
hl(0, "DiffText",   { fg = c.gray5, bold = true })
hl(0, "Added",      { fg = c.green })
hl(0, "Removed",    { fg = c.red })
hl(0, "Changed",    { fg = c.gray5 })

-- ============================================================================
-- Spelling (not defined in Helix theme; kept close to the palette)
-- ============================================================================
hl(0, "SpellBad",   { sp = c.red,        undercurl = true })
hl(0, "SpellCap",   { sp = c.yellow2,    undercurl = true })
hl(0, "SpellLocal", { sp = c.turquoise1, undercurl = true })
hl(0, "SpellRare",  { sp = c.brown,      undercurl = true })

-- ============================================================================
-- Legacy syntax groups  (maps Helix's non-namespaced scopes)
-- ============================================================================
hl(0, "Comment",        { fg = c.gray5 })
hl(0, "Constant",       { fg = c.white3 })
hl(0, "String",         { fg = c.green })
hl(0, "Character",      { fg = c.green })
hl(0, "Number",         { fg = c.turquoise1 })
hl(0, "Boolean",        { fg = c.white3 })
hl(0, "Float",          { fg = c.turquoise1 })
hl(0, "Identifier",     { fg = c.white3 })
hl(0, "Function",       { fg = c.yellow1 })
hl(0, "Statement",      { fg = c.red })
hl(0, "Conditional",    { fg = c.red })
hl(0, "Repeat",         { fg = c.red })
hl(0, "Label",          { fg = c.red })
hl(0, "Operator",       { fg = c.white1 })
hl(0, "Keyword",        { fg = c.red })
hl(0, "Exception",      { fg = c.red })
hl(0, "PreProc",        { fg = c.red })
hl(0, "Include",        { fg = c.red })
hl(0, "Define",         { fg = c.red })
hl(0, "Macro",          { fg = c.yellow1 })
hl(0, "PreCondit",      { fg = c.red })
hl(0, "Type",           { fg = c.white3, italic = true })
hl(0, "StorageClass",   { fg = c.red })
hl(0, "Structure",      { fg = c.white3, italic = true })
hl(0, "Typedef",        { fg = c.white3, italic = true })
hl(0, "Special",        { fg = c.yellow1 })
hl(0, "SpecialChar",    { fg = c.turquoise1 })
hl(0, "Tag",            { fg = c.white3 })
hl(0, "Delimiter",      { fg = c.white1 })
hl(0, "SpecialComment", { fg = c.gray5 })
hl(0, "Underlined",     { fg = c.turquoise2, underline = true })
hl(0, "Ignore",         { fg = c.gray4 })
hl(0, "Error",          { fg = c.red })
hl(0, "Todo",           { fg = c.yellow2, bold = true })

-- ============================================================================
-- Treesitter @-groups (Helix and Neovim both use tree-sitter capture names,
-- so these map almost 1:1 onto the same autumn.toml scopes)
-- ============================================================================
hl(0, "@comment",               { link = "Comment" })
hl(0, "@comment.documentation", { fg = c.gray5 })
hl(0, "@string",                { link = "String" })
hl(0, "@string.escape",         { fg = c.turquoise1 })
hl(0, "@string.regexp",         { fg = c.turquoise1 })
hl(0, "@string.special",        { fg = c.turquoise1 })
hl(0, "@character",             { link = "Character" })
hl(0, "@character.special",     { fg = c.turquoise1 })
hl(0, "@number",                { link = "Number" })
hl(0, "@number.float",          { fg = c.turquoise1 })
hl(0, "@boolean",               { link = "Boolean" })
hl(0, "@constant",              { link = "Constant" })
hl(0, "@constant.builtin",      { fg = c.white3 })
hl(0, "@constant.macro",        { fg = c.white3 })
hl(0, "@constructor",           { fg = c.yellow1 })
hl(0, "@function",               { link = "Function" })
hl(0, "@function.builtin",      { fg = c.yellow1 })
hl(0, "@function.call",         { fg = c.yellow1 })
hl(0, "@function.macro",        { fg = c.yellow1 })
hl(0, "@function.method",       { fg = c.yellow1 })
hl(0, "@function.method.call",  { fg = c.yellow1 })
hl(0, "@method",                { fg = c.yellow1 })
hl(0, "@method.call",           { fg = c.yellow1 })
hl(0, "@keyword",               { link = "Keyword" })
hl(0, "@keyword.function",      { fg = c.red })
hl(0, "@keyword.operator",      { fg = c.red })
hl(0, "@keyword.return",        { fg = c.red })
hl(0, "@keyword.conditional",   { fg = c.red })
hl(0, "@keyword.repeat",        { fg = c.red })
hl(0, "@keyword.import",        { fg = c.red })
hl(0, "@keyword.storage",       { fg = c.red })
hl(0, "@keyword.directive",     { fg = c.red })
hl(0, "@conditional",           { fg = c.red })
hl(0, "@repeat",                { fg = c.red })
hl(0, "@label",                 { link = "Label" })
hl(0, "@operator",              { link = "Operator" })
hl(0, "@punctuation.delimiter", { fg = c.white1 })
hl(0, "@punctuation.bracket",   { fg = c.white1 })
hl(0, "@punctuation.special",   { fg = c.yellow1 })
hl(0, "@type",                  { link = "Type" })
hl(0, "@type.builtin",          { fg = c.white3, italic = true })
hl(0, "@type.definition",       { fg = c.white3, italic = true })
hl(0, "@attribute",             { fg = c.turquoise1 })
hl(0, "@variable",               { fg = c.white3 })
hl(0, "@variable.builtin",      { fg = c.white3 })
hl(0, "@variable.parameter",    { fg = c.white3 })
hl(0, "@variable.member",       { fg = c.brown })
hl(0, "@property",              { fg = c.brown })
hl(0, "@field",                 { fg = c.brown })
hl(0, "@namespace",             { fg = c.white3 })
hl(0, "@module",                { fg = c.white3 })
hl(0, "@tag",                   { fg = c.white3 })
hl(0, "@tag.attribute",         { fg = c.turquoise1 })
hl(0, "@tag.delimiter",         { fg = c.white1 })
hl(0, "@markup.heading",        { fg = c.yellow1, bold = true })
hl(0, "@markup.strong",         { bold = true })
hl(0, "@markup.italic",         { italic = true })
hl(0, "@markup.strikethrough",  { strikethrough = true })
hl(0, "@markup.underline",      { underline = true })
hl(0, "@markup.link",           { fg = c.white2 })
hl(0, "@markup.link.label",     { fg = c.white2 })
hl(0, "@markup.link.url",       { fg = c.turquoise2, underline = true })
hl(0, "@markup.list",           { fg = c.white2 })
hl(0, "@markup.quote",          { fg = c.brown })
hl(0, "@markup.raw",            { fg = c.green })
hl(0, "@markup.raw.block",      { fg = c.green })
hl(0, "@diff.plus",             { fg = c.green })
hl(0, "@diff.minus",            { fg = c.red })
hl(0, "@diff.delta",            { fg = c.gray5 })
hl(0, "@spell",                 { fg = c.none })
hl(0, "@error",                 { fg = c.red })

-- LSP semantic tokens fall back to the equivalent Treesitter captures above
hl(0, "@lsp.type.class",         { link = "@type" })
hl(0, "@lsp.type.comment",       { link = "@comment" })
hl(0, "@lsp.type.decorator",     { link = "@attribute" })
hl(0, "@lsp.type.enum",          { link = "@type" })
hl(0, "@lsp.type.enumMember",    { link = "@constant" })
hl(0, "@lsp.type.function",      { link = "@function" })
hl(0, "@lsp.type.interface",     { link = "@type" })
hl(0, "@lsp.type.keyword",       { link = "@keyword" })
hl(0, "@lsp.type.macro",         { link = "@function.macro" })
hl(0, "@lsp.type.method",        { link = "@function.method" })
hl(0, "@lsp.type.namespace",     { link = "@namespace" })
hl(0, "@lsp.type.parameter",     { link = "@variable.parameter" })
hl(0, "@lsp.type.property",      { link = "@property" })
hl(0, "@lsp.type.string",        { link = "@string" })
hl(0, "@lsp.type.struct",        { link = "@type" })
hl(0, "@lsp.type.type",          { link = "@type" })
hl(0, "@lsp.type.typeParameter", { link = "@type" })
hl(0, "@lsp.type.variable",      { link = "@variable" })

hl(0, "LspInlayHint",     { fg = c.gray4, bg = c.black })
hl(0, "LspReferenceText", { bg = c.gray3 })
hl(0, "LspReferenceRead", { bg = c.gray3 })
hl(0, "LspReferenceWrite",{ bg = c.gray3 })
hl(0, "LspCodeLens",      { fg = c.gray4 })
hl(0, "LspSignatureActiveParameter", { fg = c.yellow1, bold = true })

-- ============================================================================
-- Terminal colours
-- (Autumn has no dedicated blue/magenta; nearest turquoise/brown tones used)
-- ============================================================================
vim.g.terminal_color_0  = c.gray0
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow1
vim.g.terminal_color_4  = c.turquoise2
vim.g.terminal_color_5  = c.brown
vim.g.terminal_color_6  = c.turquoise1
vim.g.terminal_color_7  = c.white1
vim.g.terminal_color_8  = c.gray5
vim.g.terminal_color_9  = c.red
vim.g.terminal_color_10 = c.green
vim.g.terminal_color_11 = c.yellow2
vim.g.terminal_color_12 = c.turquoise2
vim.g.terminal_color_13 = c.brown
vim.g.terminal_color_14 = c.turquoise1
vim.g.terminal_color_15 = c.gray8

-- ============================================================================
-- Common plugin integrations (optional; kept minimal and palette-only)
-- ============================================================================
-- gitsigns.nvim
hl(0, "GitSignsAdd",    { fg = c.green })
hl(0, "GitSignsChange", { fg = c.gray5 })
hl(0, "GitSignsDelete", { fg = c.red })
-- telescope.nvim
hl(0, "TelescopeBorder",       { fg = c.gray3,  bg = c.gray2 })
hl(0, "TelescopeNormal",       { fg = c.white1, bg = c.gray2 })
hl(0, "TelescopeSelection",    { fg = c.white1, bg = c.gray3 })
hl(0, "TelescopePromptBorder", { fg = c.gray3,  bg = c.gray2 })
hl(0, "TelescopeMatching",     { fg = c.yellow1, bold = true })
-- nvim-cmp / blink.cmp
hl(0, "CmpItemAbbrMatch",    { fg = c.yellow1, bold = true })
hl(0, "CmpItemKindFunction", { fg = c.yellow1 })
hl(0, "CmpItemKindVariable", { fg = c.white3 })
hl(0, "CmpItemKindKeyword",  { fg = c.red })
-- indent guides (helix ui.virtual.indent-guide style, using gray1/ruler tone)
hl(0, "IndentBlanklineChar",         { fg = c.gray2 })
hl(0, "IndentBlanklineContextChar",  { fg = c.gray3 })
