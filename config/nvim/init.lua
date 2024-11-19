local scripts = {
    "options", -- vim设置, vimrc的东西放这
    "keymaps", -- vim按键映射
    "plugins", -- 安装的插件

    "clip-image-config",
    "nvim-tree", -- 文件选择
    "telescope", -- 快速跳转文件

    "comment", -- 快速注释
    "chinese-char-navigator", -- 中文首字母跳转
    "toggle-val", -- 快速切换 true-false, 等状态

    -- "color",
    -- "cmp",
    -- "lsp",
    -- "treesitter",
    -- "autopairs",
    -- "snippets",
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
