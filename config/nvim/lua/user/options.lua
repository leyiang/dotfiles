-- :help options
local options = {
    backup = false,
    cmdheight = 2,
    autoindent = true,
    fileencoding = 'utf-8',
    hlsearch = false,
    pumheight = 10,
    smartindent = true,
    termguicolors = true,
    splitbelow = true,
    splitright = true,
    expandtab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    cursorline = true,
    number = true,
    --relativenumber = true,
    wrap = false,
    -- signcolumn = 'yes',
    scrolloff = 8,
    list = true,
    clipboard = 'unnamedplus'
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
