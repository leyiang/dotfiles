vim.api.nvim_create_user_command('ToggleBool',function()
    local current_word = vim.fn.expand("<cword>")

    local dict = {
        ["true"]  = "false", ["false"] = "true",
        ["True"]  = "False", ["False"] = "True",
        ["1"] = "0", ["0"] = "1",
        ["on"] = "off", ["off"] = "on",

        ["yes"] = "no", ["no"] = "yes",
        ["enable"] = "disable", ["disable"] = "enable",
        ["enabled"] = "disabled", ["disabled"] = "enabled",
    }

    local new_word = dict[ current_word ]

    if new_word ~= nil then
        vim.api.nvim_command("normal ciw" .. new_word )
    end
end,{})
