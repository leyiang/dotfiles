local configs = require("nvim-treesitter.configs")

configs.setup {
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = false, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },

  indent = { enable = true, disable = { "yaml" } },
}
