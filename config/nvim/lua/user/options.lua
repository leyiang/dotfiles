-- :help optionsoptin
local options = {
	backup = false,
	cmdheight = 2,
	smartindent = true,
	fileencoding = "utf-8",
	hlsearch = false,
	pumheight = 10,
	termguicolors = true,
	splitbelow = true,
	splitright = true,
	cursorline = true,
	number = true,
	relativenumber = true,
	wrap = false,
	scrolloff = 8,
	list = true,
	clipboard = "unnamedplus",
	bg = "light",
	ignorecase = true,

	autoindent = true,
	expandtab = false,
	shiftwidth = 4,
	tabstop = 4,

	listchars = "space:_,tab:>#,trail:~",
	list = true,

	-- autochdir = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.opt.list = false
vim.g.loaded_matchparen = false
vim.o.termguicolors = true

vim.diagnostic.config({
	signs = false,
})
