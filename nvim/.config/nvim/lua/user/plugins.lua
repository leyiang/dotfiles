local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen NeoVim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads NeoVim whenever you save the plugins.lua file --
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Require `packer` fails")
    return
end

-- Hav Packer use a popup window --
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My Plugins Here
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use {
        "iamcco/markdown-preview.nvim",
        ft = { "md", "markdown" },
    }

    -- Color Theme
    use "jacoborus/tender.vim"
    use "folke/tokyonight.nvim"

    -- Auto Completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"

    -- Snippet
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- Auto Pair
    -- use "jiangmiao/auto-pairs"
    use "windwp/nvim-autopairs"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "tamago324/nlsp-settings.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    -- Comment
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Nvim Tree
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"

    -- Vim Game To Train Vim Motion :)
    use "ThePrimeagen/vim-be-good"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
