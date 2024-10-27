--- NVIM中文跳转

local pinyin = require 'user.pinyin'
local utf8 = require 'lua-utf8'

local dev_level = 3

local function log( info, level )
    level = level or 1

    if level >= dev_level then
        print( info )
    end
end

local function jumpToIndex(cursor_pos, idx )
    log("跳转到:" .. idx)
    vim.api.nvim_win_set_cursor(0, { cursor_pos[1], idx })
end

local function getPos(line, toFind, cursor_pos)
    cur_pos = vim.fn.getcursorcharpos()[3]

    for i = cur_pos+1, utf8.len(line) do
        ch = utf8.sub(line, i, i)
        prefix = pinyin.getPinYin( ch )
        log("遍历当前行: " .. ch)

        if prefix and prefix == toFind then
            local idx = line:find(ch, cursor_pos[2] + 2)
            return utf8.offset(line, i)
        end
    end

    return nil
end

local function getCapPinyin()
    py = require("python")
end

local function jumpToChar(reverse)
    if reverse then
        print("Reverse!!")
    else
        print("normal")
    end

    local input = vim.fn.getcharstr()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()

    local initial = input:sub(1, 1)  -- Get the initial character

    log("准备查找首字母: " .. initial)

    if target_chars ~= "" then
        idx = getPos( line, initial, cursor_pos, reverse )

        if idx then
            jumpToIndex( cursor_pos, idx )
            return
        end

        log("找不到: " .. initial, 3)
    else
        log("需要完善字典")
    end
end

vim.api.nvim_set_keymap('n', 's', '', { noremap = true, silent = true, callback=jumpToChar })
vim.api.nvim_set_keymap('v', 's', '', { noremap = true, silent = true, callback=jumpToChar })

vim.api.nvim_set_keymap('n', 'S', '', { noremap = true, silent = true, callback=function() jumpToChar(1) end })
vim.api.nvim_set_keymap('v', 'S', '', { noremap = true, silent = true, callback=function() jumpToChar(1) end })

