-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- My Plugins Here
	"wbthomason/packer.nvim",
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",

	-- Telescope
	"nvim-telescope/telescope-symbols.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",

	-- Nvim Tree
	-- "nvim-tree/nvim-web-devicons",
	-- "nvim-tree/nvim-tree.lua",

	-- Past Image From Clipboard(自己写的插件,暂时不用)
	"leyiang/clipboard-image.nvim",

	-- gcc 可以自动注释
	"numToStr/Comment.nvim",

	-- 表格式对齐 plugin
	"godlygeek/tabular",

	-- lazy git
	-- "kdheepak/lazygit.nvim",

	-- treesitter
	"nvim-treesitter/nvim-treesitter",

	-- 生成jsdoc类似的注释
	"danymat/neogen",

	-- cmp
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"neovim/nvim-lspconfig",

	-- formatter
	--  'stevearc/conform.nvim'
	"mhartington/formatter.nvim",

	-- 修改surrounding
	"tpope/vim-surround",

	-- 多选修改
	"mg979/vim-visual-multi",

	-- 资源管理器mason, 安装formatter, LSP模块
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	{
		-- yazi 插件, 没有修改
		dir = "/home/yiang/Work/yazi.nvim",
		event = "VeryLazy",
		opts = {
			open_for_directories = true,
		},
	},

	{
		-- Lazy Git 插件, 在本地, 修复了不自动调整大小的BUG
		dir = "/home/yiang/Work/nvim-plugs/lazygit.nvim"
	},

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
		  library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		  },
	},
  },
}

require("lazy").setup(plugins)
