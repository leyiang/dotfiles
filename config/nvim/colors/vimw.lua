-- Made with 'mini.colors' module of https://github.com/echasnovski/mini.nvim

vim.g.colors_name = "vimw"

-- Highlight groups
local hi = vim.api.nvim_set_hl

hi(0, "@attribute.builtin", { link = "Special" })
hi(0, "@character.special", { link = "SpecialChar" })
hi(0, "@comment.todo", { link = "Todo" })
hi(0, "@constant.builtin", { link = "Special" })
hi(0, "@constant.macro", { link = "Define" })
hi(0, "@function.builtin", { link = "Special" })
hi(0, "@function.macro", { link = "Macro" })
hi(0, "@function.method", { link = "Function" })
hi(0, "@keyword.conditional", { link = "Conditional" })
hi(0, "@keyword.debug", { link = "Debug" })
hi(0, "@keyword.directive", { link = "PreProc" })
hi(0, "@keyword.exception", { link = "Exception" })
hi(0, "@keyword.import", { link = "Include" })
hi(0, "@keyword.repeat", { link = "Repeat" })
hi(0, "@keyword.type", { link = "Structure" })
hi(0, "@lsp.type.class", { link = "Structure" })
hi(0, "@lsp.type.comment", { link = "Comment" })
hi(0, "@lsp.type.decorator", { link = "Function" })
hi(0, "@lsp.type.enum", { link = "Structure" })
hi(0, "@lsp.type.enumMember", { link = "Constant" })
hi(0, "@lsp.type.function", { link = "Function" })
hi(0, "@lsp.type.interface", { link = "Structure" })
hi(0, "@lsp.type.macro", { link = "Macro" })
hi(0, "@lsp.type.method", { link = "Function" })
hi(0, "@lsp.type.namespace", { link = "Structure" })
hi(0, "@lsp.type.parameter", { link = "Identifier" })
hi(0, "@lsp.type.property", { link = "Identifier" })
hi(0, "@lsp.type.struct", { link = "Structure" })
hi(0, "@lsp.type.type", { link = "Type" })
hi(0, "@lsp.type.typeParameter", { link = "Typedef" })
hi(0, "@lsp.type.variable", { link = "Identifier" })
hi(0, "@markup.heading", { link = "Title" })
hi(0, "@markup.heading.1.delimiter.vimdoc", { nocombine = true, underdouble = true })
hi(0, "@markup.heading.2.delimiter.vimdoc", { nocombine = true, underline = true })
hi(0, "@markup.link", { link = "Identifier" })
hi(0, "@markup.link.url", { link = "Underlined" })
hi(0, "@markup.raw", { link = "Comment" })
hi(0, "@markup.underline", { link = "Underlined" })
hi(0, "@module", { link = "Identifier" })
hi(0, "@number.float", { link = "Float" })
hi(0, "@string.escape", { link = "SpecialChar" })
hi(0, "@string.special", { link = "SpecialChar" })
hi(0, "@tag.builtin", { link = "Special" })
hi(0, "@type.definition", { link = "Typedef" })
hi(0, "@variable", { link = "Identifier" })
hi(0, "@variable.member", { link = "Identifier" })
hi(0, "@variable.parameter", { link = "Identifier" })
hi(0, "@variable.parameter.builtin", { link = "Special" })
hi(0, "CmpItemAbbrDeprecatedDefault", { fg = "#0000ff" })
hi(0, "CmpItemKindClassDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindColorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindConstantDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindConstructorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindDefault", { fg = "#6a5acd" })
hi(0, "CmpItemKindEnumDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindEnumMemberDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindEventDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFieldDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFileDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFolderDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFunctionDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindInterfaceDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindKeywordDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindMethodDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindModuleDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindOperatorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindPropertyDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindReferenceDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindSnippetDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindStructDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindTextDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindTypeParameterDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindUnitDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindValueDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindVariableDefault", { link = "CmpItemKind" })
hi(0, "ColorColumn", { bg = "#ffbbbb", ctermbg = 224 })
hi(0, "Comment", { ctermfg = 4, fg = "#0000ff" })
hi(0, "Constant", { ctermfg = 1, fg = "#ff00ff" })
hi(0, "CurSearch", { link = "Search" })
hi(0, "Cursor", vim.empty_dict())
hi(0, "CursorColumn", { bg = "#e5e5e5", ctermbg = 7 })
hi(0, "CursorLine", { bg = "#e5e5e5" })
hi(0, "CursorLineNr", { bold = true, ctermfg = 130, fg = "#a52a2a" })
hi(0, "Delimiter", { link = "Special" })
hi(0, "DiagnosticDeprecated", { sp = "#ff0000", strikethrough = true })
hi(0, "DiagnosticError", { ctermfg = 1, fg = "#ff0000" })
hi(0, "DiagnosticInfo", { ctermfg = 4, fg = "#add8e6" })
hi(0, "DiagnosticOk", { ctermfg = 10, fg = "#90ee90" })
hi(0, "DiagnosticUnderlineError", { sp = "#ff0000", underline = true })
hi(0, "DiagnosticUnderlineInfo", { sp = "#add8e6", underline = true })
hi(0, "DiagnosticUnderlineOk", { sp = "#90ee90", underline = true })

hi(0, "DiffAdd", { bg = "#add8e6", ctermbg = 81 })
hi(0, "DiffChange", { bg = "#ffbbff", ctermbg = 225 })
hi(0, "DiffDelete", { bg = "#e0ffff", bold = true, ctermbg = 159, ctermfg = 12, fg = "#0000ff" })
hi(0, "DiffText", { bg = "#ff0000", bold = true, ctermbg = 9 })
hi(0, "Directory", { ctermfg = 4, fg = "#0000ff" })
hi(0, "Error", { bg = "#ff0000", ctermbg = 9, ctermfg = 15, fg = "#ffffff" })
hi(0, "ErrorMsg", { bg = "#ff0000", ctermbg = 1, ctermfg = 15, fg = "#ffffff" })
hi(0, "FloatBorder", { link = "WinSeparator" })
hi(0, "FloatFooter", { link = "Title" })
hi(0, "FloatShadow", { bg = "#000000", blend = 80 })
hi(0, "FloatShadowThrough", { bg = "#000000", blend = 100 })
hi(0, "FoldColumn", { bg = "#808080", ctermbg = 248, ctermfg = 4, fg = "#00008b" })
hi(0, "Function", { link = "Identifier" })
hi(0, "Identifier", { ctermfg = 6, fg = "#008b8b" })
-- hi(0, "Ignore", { ctermfg = 15, <metatable> = { __tostring = <function 1> } })
hi(0, "IncSearch", { reverse = true })
hi(0, "LineNr", { ctermfg = 130, fg = "#a52a2a" })
hi(0, "MatchParen", { bg = "#00ffff", ctermbg = 14 })
hi(0, "ModeMsg", { bold = true })
hi(0, "MoreMsg", { bold = true, ctermfg = 2, fg = "#2e8b57" })
hi(0, "NonText", { bold = true, ctermfg = 12, fg = "#0000ff" })
hi(0, "Normal", vim.empty_dict())
hi(0, "NormalFloat", { link = "Pmenu" })
hi(0, "Operator", { link = "Statement" })
hi(0, "Pmenu", { bg = "#ffbbff", ctermbg = 225, ctermfg = 0 })
hi(0, "PmenuMatch", { link = "Pmenu" })
hi(0, "PmenuMatchSel", { link = "PmenuSel" })
hi(0, "PmenuSbar", { bg = "#808080", ctermbg = 248 })
hi(0, "PmenuSel", { bg = "#808080", ctermbg = 7, ctermfg = 0 })
hi(0, "PmenuThumb", { bg = "#000000", ctermbg = 0 })
hi(0, "PreProc", { ctermfg = 5, fg = "#6a0dad" })
hi(0, "Question", { bold = true, ctermfg = 2, fg = "#2e8b57" })
hi(0, "QuickFixLine", { link = "Search" })
hi(0, "RedrawDebugClear", { bg = "#ffff00", ctermbg = 11 })
hi(0, "RedrawDebugComposed", { bg = "#008000", ctermbg = 10 })
hi(0, "RedrawDebugRecompose", { bg = "#ff0000", ctermbg = 9 })
hi(0, "Search", { bg = "#ffff00", ctermbg = 11 })
hi(0, "SignColumn", { bg = "#808080", ctermbg = 248, ctermfg = 4, fg = "#00008b" })
hi(0, "Special", { ctermfg = 5, fg = "#6a5acd" })
hi(0, "SpecialKey", { ctermfg = 4, fg = "#0000ff" })
hi(0, "SpellBad", { ctermbg = 224, sp = "#ff0000", undercurl = true })
hi(0, "SpellCap", { ctermbg = 81, sp = "#0000ff", undercurl = true })
hi(0, "SpellLocal", { ctermbg = 14, sp = "#008b8b", undercurl = true })
hi(0, "SpellRare", { ctermbg = 225, sp = "#ff00ff", undercurl = true })
hi(0, "Statement", { bold = true, ctermfg = 130, fg = "#a52a2a" })
hi(0, "StatusLine", { bold = true, reverse = true })
hi(0, "StatusLineNC", { reverse = true })
hi(0, "StatusLineTerm", { bg = "#006400", bold = true, ctermbg = 2, ctermfg = 15, fg = "#ffffff" })
hi(0, "StatusLineTermNC", { bg = "#006400", ctermbg = 2, ctermfg = 15, fg = "#ffffff" })
hi(0, "String", { link = "Constant" })
hi(0, "TabLineFill", { reverse = true })
hi(0, "Title", { bold = true, ctermfg = 5, fg = "#ff00ff" })
hi(0, "Todo", { bg = "#ffff00", ctermbg = 11, ctermfg = 0, fg = "#0000ff" })
hi(0, "Type", { bold = true, ctermfg = 2, fg = "#2e8b57" })
hi(0, "Underlined", { ctermfg = 5, fg = "#6a5acd", underline = true })
hi(0, "VertSplit", { link = "Normal" })

hi(0, "WarningMsg", { ctermfg = 1, fg = "#ff0000" })
hi(0, "WildMenu", { bg = "#ffff00", ctermbg = 11, ctermfg = 0, fg = "#000000" })
hi(0, "WinBar", { bold = true })
hi(0, "WinBarNC", { link = "WinBar" })
hi(0, "WinSeparator", { link = "VertSplit" })
hi(0, "lCursor", vim.empty_dict())

hi(0, "Visual", { bg = "#d3d3d3", ctermbg = 248, ctermfg = 0, fg = "#000000" })
hi(0, "TabLine", { bg = "#d3d3d3", ctermbg = 7, ctermfg = 0, underline = true })
hi(0, "Folded", { bg = "#d3d3d3", ctermbg = 248, ctermfg = 4, fg = "#00008b" })
hi(0, "Conceal", { bg = "#a9a9a9", ctermbg = 242, ctermfg = 7, fg = "#d3d3d3" })
hi(0, "DiagnosticUnderlineHint", { sp = "#d3d3d3", underline = true })
hi(0, "DiagnosticUnderlineWarn", { sp = "#ff0000", underline = true })

-- LSP 灰色提示
hi(0, "DiagnosticHint", { ctermfg = 7, fg = "#999999" })

-- LSP 代码警告颜色
hi(0, "DiagnosticWarn", { ctermfg = 3, fg = "#ff64a0" })

-- No terminal colors defined
