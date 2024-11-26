local opts = {
    noremap = true,
    silent = true
}

local leader = " "
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = leader
vim.g.maplocalleader = leader

local keymaps = {
    -- Normal Mode --
    n = {
        { "<C-e>", ":e#<cr>" },
        { "<C-h>", "<C-w>h" },
        { "<C-l>", "<C-w>l" },
        { "<C-j>", "<C-w>j" },
        { "<C-k>", "<C-w>k" },
	    { "<F8>", ":w <CR> :!gcc % && ./a.out <CR>"},
	    { "<F5>", ":w <CR> :!python %<CR>"},
	    { "<F6>", ":w <CR> :ter python %<CR>"},
        -- { "<leader>e", ":Lex 30<cr>" },
        { "<C-Up>", ":resize -2<cr>" },
        { "<C-Down>", ":resize +2<cr>" },
        { "<C-Left>", ":vertical resize -2<cr>" },
        { "<C-Right>", ":vertical resize +2<cr>" },
        { "<S-l>", ":bnext<cr>" },
        { "<S-h>", ":bprevious<cr>" },
        -- { "<A-j>", ":m .+1<cr>=="},
        -- { "<A-k>", ":m .-2<cr>=="},
        -- Telescope
        {
            "<leader>f",
            "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
        },
        { "<leader>t", "<cmd>Telescope live_grep<cr>" },
        { "<leader>/", "<cmd>lua require('Comment').toggle()<CR>" },
        { "<leader>i", ":Pimg<cr>" },
        { "<leader>e", ":NvimTreeToggle<cr>" },
        { "<leader>q<CR>", ":qa! <CR>" },
        { "<leader>w<CR>", ":w <CR>" },
        { "<leader>wq", ":wqa <CR>" },
        { "<leader>yp", ":!echo %:p | xclip -selection clipboard <CR><CR>" },
        { "<leader>sub", ":! subl %:p<CR>" },
        { "<leader>t", ":ToggleBool<CR>" },
        { "<leader>lg", "<cmd>LazyGit<CR>" },
        { "<leader>ng", "<cmd>Neogen<CR>" },
        { "<leader>ala", ":!alacritty& <CR>" },
    },
    i = {
        {"<F3>", '<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>'}
    },
    v = {
        { "<", "<gv" },
        { ">", ">gv" },
        {"<leader>a", ":w !xclip -i -sel c<CR><CR>"},

        -- :m .+1 -- Move one line downward
        -- == -- double equal sign re-indent the line.
        -- gv -- preserve selection (:help gv)

        { "<A-j>", ":m .+2<cr>==gv"},
        { "<A-k>", ":m .-2<cr>==gv"},
        { "p", '"_dP' },

        { "<leader>q<CR>", ":qa! <CR>" },
        { "<leader>w<CR>", ":<C-u>w <CR>" },
        { "<leader>wq", ":<C-u>wqa <CR>" },
    },

    x = {
        { "<A-j>", ":m .+2<cr>==gv"},
        { "<A-k>", ":m .-2<cr>==gv"},
    }
}

for mode, mapList in pairs(keymaps) do
    for index, info in pairs(mapList) do
        keymap(mode, info[1], info[2], opts)
    end
end

vim.api.nvim_set_keymap('v', 'H', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('v', 'L', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('v', 'J', '<Nop>', {noremap = true})

vim.api.nvim_set_keymap('v', "<leader>tab", ":Tabular /", {noremap = true})
