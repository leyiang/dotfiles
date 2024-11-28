local scripts = {
	"options",                -- vim设置, vimrc的东西放这
	"keymaps",                -- vim按键映射
	"plugins",                -- 安装的插件

	"telescope",              -- 快速跳转文件

	"comment",                -- 快速注释
	"toggle-val",             -- 快速切换 true-false, 等状态
	"treesitter",             -- AST插件, 其它各种插件都需要treesitter的支持
	"neogen",                 -- 注释生成 jsdoc

	"conform",                -- formatter
	"mason",                  -- mason管理器

	"chinese-char-navigator", -- 中文首字母跳转
	"color",                  -- nvim配色

	"auto_commands",          -- 自动化
	"lsp",
	"cmp",                    -- 代码提示插件

	-- "nvim-tree" -- 文件选择
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
