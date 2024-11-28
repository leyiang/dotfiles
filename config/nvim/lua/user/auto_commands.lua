vim.cmd([[autocmd BufWritePost /home/yiang/Work/dotfiles/alias !sync_cd_alias]])

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*", -- Matches all file types. Adjust as needed.
	callback = function()
		-- Get file path, file folder, and buffer type
		local file_path = vim.fn.expand("%:p") -- Full file path
		local file_folder = vim.fn.getcwd() -- File's directory
		local buftype = vim.api.nvim_buf_get_option(0, "buftype") -- Buffer type
		local command = string.format("cd_nvim_utils set %s %s %s", file_path, file_folder, buftype)

		-- Run the command
		vim.fn.system(command)
	end,
})

-- Automatically save a backup of files from ~/projects/ folder
vim.api.nvim_create_augroup("AutoSaveToBackup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "AutoSaveToBackup",
	pattern = "/home/yiang/Work/tamper-scripts/src/*", -- Only files under the ~/projects/ folder
	callback = function()
		-- Run the command
		vim.fn.jobstart("cd /home/yiang/Work/tamper-scripts/ && ./build")
	end,
})
