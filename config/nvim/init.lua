local scripts = {
    "options",
    "keymaps",
    "plugins",
    -- "color",
    -- "cmp",
    -- "lsp",
    "nvim-tree",
    "telescope",
    -- "treesitter",
    -- "autopairs",
    "comment",
    -- "snippets",
    "clip-image-config",

    "chinese-char-navigator",
}

for k, script in pairs(scripts) do
    require("user." .. script)
    -- local status_ok, _ = pcall(require, "user." .. script)

    -- if not status_ok then
    --     vim.notify("Option Script: " .. script .. " not found")
    --     return
    -- end
end

vim.g.loaded_matchparen = false
vim.o.termguicolors = true
-- vim.cmd "colorscheme default"
