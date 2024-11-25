local scripts = {
    "options",                -- vim设置, vimrc的东西放这
    "keymaps",                -- vim按键映射
    "plugins",                -- 安装的插件

    "nvim-tree",              -- 文件选择
    "telescope",              -- 快速跳转文件

    "comment",                -- 快速注释
    "toggle-val",             -- 快速切换 true-false, 等状态
    "treesitter",             -- AST插件, 其它各种插件都需要treesitter的支持
    "cmp",                    -- 代码提示插件
    "neogen",                 -- 注释生成 jsdoc

    "conform",                -- formatter
    "mason",                  -- mason管理器

    "chinese-char-navigator", -- 中文首字母跳转
    "color",                  -- nvim配色
    -- "lsp",
    -- "autopairs",
    -- "snippets",
    -- "clip-image-config",

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

vim.cmd([[autocmd BufWritePost /home/yiang/Work/dotfiles/alias !sync_cd_alias]])

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",  -- Matches all file types. Adjust as needed.
    callback = function()
        -- Get file path, file folder, and buffer type
        local file_path = vim.fn.expand("%:p")  -- Full file path
        local file_folder = vim.fn.getcwd()  -- File's directory
        local buftype = vim.api.nvim_buf_get_option(0, 'buftype')  -- Buffer type
        local command = string.format("cd_nvim_utils set %s %s %s", file_path, file_folder, buftype)

        -- Run the command
        vim.fn.system(command)
    end,
})
