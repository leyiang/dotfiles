require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = false,
		emphasis = false,
		comments = false,
		operators = false,
		folds = false,
	},

	palette_overrides = {
		-- 背景色
		light0 = "#fffae8",

		-- 光标高亮色
		-- light1 = "#E5E5E5",
		light1 = "#E5E5E5",

		-- 状态栏背景色
		light2 = "#E5E5E5",

		-- 文字颜色
		faded_green = "#ff01ff",

		-- true,false 颜色
		faded_purple = "#ff01ff",

		-- 注释颜色
		gray = "#0000FF",

		-- 行号色
		light4 = "#a52a2a",
	},

	overrides = {
		Whitespace = { fg = "#D5D5D5" },
	},
})

-- vim.cmd("set background=light")
vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme vim")
