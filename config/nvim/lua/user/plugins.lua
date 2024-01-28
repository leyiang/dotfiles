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


--- Autocommand that reloads NeoVim whenever you save the plugins.lua file --
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Hav Packer use a popup window --
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Require `packer` fails")
    return
end
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


    -- Telescope
    use 'nvim-telescope/telescope-symbols.nvim'
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- Nvim Tree
    use "nvim-tree/nvim-web-devicons"
    use "nvim-tree/nvim-tree.lua"

    -- Vim Game To Train Vim Motion :)
    use "ThePrimeagen/vim-be-good"

    -- Past Image From Clipboard
    use 'leyiang/clipboard-image.nvim'

    -- Comment Plugin
    use 'numToStr/Comment.nvim'

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
