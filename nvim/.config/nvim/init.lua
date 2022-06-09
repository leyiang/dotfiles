local scripts = {
    "options",
    "keymaps",
    "plugins",
    "color",
    "cmp",
    "lsp",
    "telescope",
    "treesitter",
    "autopairs",
    "comment",
    "nvim-tree",
    "snippets",
}

for k, script in pairs(scripts) do
    require("user." .. script)
    -- local status_ok, _ = pcall(require, "user." .. script)

    -- if not status_ok then
    --     vim.notify("Option Script: " .. script .. " not found")
    --     return
    -- end
end
