require("clipboard-image").setup({
	-- Default configuration for all filetype
	default = {
		img_dir = "images",
		img_dir_txt = "",
		img_name = function()
			local path = vim.fn.expand("%")
			local subject = path:match("cards/([a-z]+)/") .. "_"
			--vim.notify(subject)
			--vim.notify(vim.loop.cwd())
			return subject .. os.date("%Y-%m-%d-%H-%M-%S")
		end, -- Example result: "2021-04-13-10-04-18"
		affix = "image:%s", -- Multi lines affix
	},
})
