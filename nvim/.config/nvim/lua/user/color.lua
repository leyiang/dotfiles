vim.cmd "colorscheme default"

local color = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. color)

if not status_ok then
    vim.notify("colorscheme " .. color .. " not found")
    return
end
