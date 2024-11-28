require("nvim-web-devicons").setup({
	override = {
		toml = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh",
		},
	},
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	update_focused_file = {
		enable = true,
		-- update_cwd = true,
	},
	-- update_cwd = true,
})

vim.g.nvim_tree_respect_buf_cwd = 1
