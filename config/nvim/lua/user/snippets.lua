local ls = require("luasnip")
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("all", {
	ls.snippet("log", {
		t("console.log( "),
		i(1, ""),
		t(" )"),
		i(2, ""),
	}),
})

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
