local scripts = {
	-- tabular: /--
	"options",       -- vim设置, vimrc的东西放这
	"keymaps",       -- vim按键映射
	"plugins",       -- 安装的插件
	"telescope",     -- 快速跳转文件
	"comment",       -- 快速注释
	"toggle-val",    -- 快速切换 true-false, 等状态
	"treesitter",    -- AST插件, 其它各种插件都需要treesitter的支持
	"conform",       -- formatter
	"mason",         -- mason管理器
	"color",         -- nvim配色
	"lsp",
	"auto_commands", -- 自动化
	"snippets",
	"cmp",           -- 代码提示插件
	-- tabular-end --
	"chinese-char-navigator", -- 中文首字母跳转

	-- "neogen",        -- 注释生成 jsdoc
	-- "nvim-tree"--文件选择
	-- "autopairs",
	-- "clip-image-config",
}

-- require("colors.vimw")
for k, script in pairs(scripts) do
	require("user." .. script)
	-- local status_ok, _ = pcall(require, "user." .. script)

	-- if not status_ok then
	-- vim.notify("Option Script: " .. script .. " not found")
	-- return
	-- end
end

local config = {
	virtual_text = false, -- Disable virtual text.
	-- signs = {
	-- 	-- active = signs, -- Show signs.
	-- },
	update_in_insert = true,
	-- underline = true,
	-- severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)


vim.api.nvim_create_user_command('InsertJson', function()
    -- 获取当前缓冲区的所有行
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    
    -- 定义一个函数来寻找最近的 JSON 块
    local function find_json_block_end(start_line)
        for i = start_line, #lines do
            if lines[i]:match '^%s*}' then
                return i
            end
        end
        return nil
    end
    
    -- 找到当前行
    local current_line_number = vim.api.nvim_win_get_cursor(0)[1] - 1
    
    -- 寻找最近的 JSON 块的结束位置
    local block_end_line = find_json_block_end(current_line_number)
    
    if block_end_line then
		local last_char = lines[block_end_line-1]:sub(-1)
        if last_char ~= ',' then
            -- 如果没有逗号，则添加
            lines[block_end_line-1] = lines[block_end_line-1] .. ','
        end

        -- 插入新行并添加文本
        local indent = lines[block_end_line-1]:match'^%s*'
        table.insert(lines, block_end_line, indent .. '"xx": "bb"')
        
        -- 更新缓冲区中的行
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
        
        -- 移动光标到新插入的行
        vim.api.nvim_win_set_cursor(0, {block_end_line-1, 0})

		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('$vi"', true, false, true), 'n', true)

		vim.opt.paste = true
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('p', true, false, true), 't', true)
		vim.opt.paste = false	
    else
        print("无法找到 JSON 块的结束")
    end
end, {})
