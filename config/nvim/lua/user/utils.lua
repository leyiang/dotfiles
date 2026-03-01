local M = {}

-- 根据当前文件类型执行不同的格式化操作
function M.format_current_file()
    -- local filetype = vim.bo.filetype
    -- local filename = vim.fn.expand('%:t')
    -- local filepath = vim.fn.expand('%:p')
    -- 
    -- -- 特殊处理 yazi keymap.toml 文件
    -- if filepath == '/home/yiang/Work/dotfiles/config/yazi/keymap.toml' then
    --     -- 保存当前光标位置
    --     local cursor_pos = vim.api.nvim_win_get_cursor(0)
    --     
    --     -- 搜索 keymap = [ 开始行
    --     vim.cmd('normal! gg')
    --     local keymap_start = vim.fn.search('keymap\\s*=\\s*\\[', 'W')
    --     
    --     if keymap_start > 0 then
    --         -- 移动到 [ 位置
    --         vim.cmd(keymap_start .. 'G')
    --         vim.cmd('normal! f[')
    --         
    --         -- 找到对应的结束 ]
    --         vim.cmd('normal! %')  -- 跳到匹配的 ]
    --         local keymap_end = vim.fn.line('.')
    --         
    --         -- 选择这个范围内的内容（不包括 [ 和 ]）
    --         vim.cmd((keymap_start + 1) .. ',' .. (keymap_end - 1) .. 'Tabularize /run/')
    --         print('Yazi keymap formatted with Tabular')
    --     else
    --         print('Could not find keymap = [ block')
    --     end
    --     
    --     -- 恢复光标位置
    --     vim.api.nvim_win_set_cursor(0, cursor_pos)
    --     return
    -- end
    -- 
    -- if filetype == 'lua' then
    --     -- Lua 文件格式化
    --     vim.cmd('silent! %s/\\s\\+$//e')  -- 移除尾随空格
    --     vim.cmd('normal! gg=G')          -- 自动缩进整个文件
    --     print('Lua file formatted')
    -- elseif filetype == 'python' then
    --     -- Python 文件处理
    --     vim.cmd('silent! %s/\\s\\+$//e')  -- 移除尾随空格
    --     print('Python file formatted')
    -- elseif filetype == 'javascript' or filetype == 'typescript' then
    --     -- JavaScript/TypeScript 处理
    --     vim.cmd('silent! %s/\\s\\+$//e')  -- 移除尾随空格
    --     vim.cmd('normal! gg=G')          -- 自动缩进
    --     print('JS/TS file formatted')
    -- elseif filetype == 'json' then
    --     -- JSON 文件格式化
    --     vim.cmd('silent! %!jq .')
    --     print('JSON file formatted')
    -- else
    --     -- 其他文件类型的通用处理
    --     vim.cmd('silent! %s/\\s\\+$//e')  -- 移除尾随空格
    --     vim.cmd('normal! gg=G')          -- 自动缩进
    --     print('File formatted (generic)')
    -- end
    -- 
    -- -- 回到原来的光标位置
    -- vim.cmd('normal! ``')
end

-- 生成带边框的注释块
function M.insert_comment_box()
    -- 提示用户输入标题文本
    vim.ui.input({ prompt = '输入注释标题: ' }, function(input)
        if input == nil or input == '' then
            return
        end
        
        -- 计算需要的#号数量，默认总宽度35个字符
        local total_width = 35
        local title_length = string.len(input)
        local spaces_needed = total_width - title_length - 2  -- 2是左右各一个空格
        
        -- 如果标题太长，调整总宽度
        if spaces_needed < 0 then
            total_width = title_length + 4  -- 最少左右各一个空格加两个#
            spaces_needed = 2
        end
        
        local left_spaces = math.floor(spaces_needed / 2)
        local right_spaces = spaces_needed - left_spaces
        
        -- 生成注释框
        local top_line = string.rep('#', total_width)
        local middle_line = '#' .. string.rep(' ', left_spaces) .. input .. string.rep(' ', right_spaces) .. '#'
        local bottom_line = top_line
        
        -- 获取当前行号
        local current_line = vim.fn.line('.')
        
        -- 插入三行内容
        local lines = { top_line, middle_line, bottom_line }
        vim.api.nvim_buf_set_lines(0, current_line - 1, current_line - 1, false, lines)
        
        -- 移动光标到插入内容的下一行
        vim.api.nvim_win_set_cursor(0, {current_line + 3, 0})
    end)
end

return M
