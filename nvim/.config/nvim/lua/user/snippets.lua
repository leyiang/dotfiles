local ls = require("luasnip")
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("all", {
    ls.snippet("log", {
        t("console.log( "), i(1, "") , t(" )"), i(2, "")
    })
})
