local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local snip_status, luasnip = pcall(require, "luasnip")
if not snip_status then
    return
end

local feedKey = function(key, mode)
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes(key, true, true, true), mode, true
    )
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<A-k>"] = cmp.mapping.select_prev_item(),
		["<A-j>"] = cmp.mapping.select_next_item(),
        ["<A-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<+>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    -- cmp.mapping.confirm({ select = true })
                    feedKey("<+>", "")
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif check_backspace() then
                    fallback()
                else
                    fallback()
                end
            end,
            
            { "i", "s" }
        )
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
                nvim_lsp = "[LSP]",
            })[entry.source.name]
            return vim_item
        end
    },
    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
    },
    window = {
        completion = {
--			winhighlight = 'Normal:YiangMenu,FloatBorder:YiangBorder,CursorLine:PmenuSel,Search:None',
        },
        documentation = cmp.config.window.bordered()
    },
    experimental = {
        ghost_text = true
    }
})

-- Highlights for nvim-cmp's custom popup menu (GH-224)
vim.cmd [[
  " Light theme: Compatible with Pmenu (#fff3bf)
  hi! link YiangMenu         TermCursor
  hi! link YiangBorder       TermCursor
]]

