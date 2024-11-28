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
	"kdheepak/lazygit.nvim",

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

	"mg979/vim-visual-multi",
	"williamboman/mason.nvim",
	{ "williamboman/mason-lspconfig.nvim" },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "latte", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
				},
			})
		end,
	},

	-- {
	--   "mikavilpas/yazi.nvim",
	--     event = "VeryLazy",
	--     opts = {
	--         open_for_directories = true,
	--     }
	-- },

	-- "ellisonleao/gruvbox.nvim",
	{
		dir = "/home/yiang/Work/gruvbox.nvim",
	},
	{
		dir = "/home/yiang/Work/yazi.nvim",
		event = "VeryLazy",
		opts = {
			open_for_directories = true,
		},
	},

	-- 'projekt0n/github-nvim-theme'
	"rktjmp/lush.nvim",
}

vim.g.mapleader = leader
require("lazy").setup(plugins)
