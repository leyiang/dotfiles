local configs = require("nvim-treesitter.configs")

configs.setup({
    sync_install = false,
    auto_install = true,
    ensure_install = { "help", "javascript", "typescript", "lua", "rust" },
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
    },

    indent = { enable = true, disable = { "yaml" } },
})
