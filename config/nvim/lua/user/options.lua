-- :help optionsoptin
local options = {
    backup         = false,
    cmdheight      = 2,
    autoindent     = true,
    smartindent    = true,
    fileencoding   = 'utf-8',
    hlsearch       = false,
    pumheight      = 10,
    termguicolors  = true,
    splitbelow     = true,
    splitright     = true,
    expandtab      = true,
    tabstop        = 4,
    softtabstop    = 4,
    shiftwidth     = 4,
    cursorline     = true,
    number         = true,
    relativenumber = true,
    wrap           = false,
    scrolloff      = 8,
    list           = true,
    clipboard      = 'unnamedplus',
    bg             = "light",
    ignorecase     = true,

    -- signcolumn = 'yes',
    -- autochdir = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
