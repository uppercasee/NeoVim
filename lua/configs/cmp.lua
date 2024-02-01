local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	vim.notify("[WARNING] cmp module not found. Completion support disabled.",vim.log.levels.WARN,{ title = "Nvim-config" })
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	vim.notify("[WARNING] Luasnip module not found. Luasnip support disabled.",vim.log.levels.WARN,{ title = "Nvim-config" })
	return
end

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
	sources = {
        -- {name = 'copilot'}, -- TODO: Make this work later
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
		{name = 'buffer'},
		{name = 'path'},
		{name = 'luasnip'},
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<C-s>"] = cmp.mapping.abort(),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<S-CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
	}),
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
        name = 'cmdline',
        option = {
            ignore_cmds = { 'Man', '!' }
        }
        }
    })
    })

-- local buffer_fts = {
-- 	"markdown",
-- 	"toml",
-- 	"yaml",
-- 	"json",
-- }

-- local function contains(t, value)
-- 	for _, v in pairs(t) do
-- 		if v == value then
-- 			return true
-- 		end
-- 	end
-- 	return false
-- end

-- local compare = require("cmp.config.compare")

-- require("luasnip/loaders/from_vscode").lazy_load()

-- local check_backspace = function()
--   local col = vim.fn.col "." - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
-- end

-- local check_backspace = function()
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- local icons = require("configs.icons")

-- local kind_icons = icons.kind

-- vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
-- vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })
-- vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })

-- vim.g.cmp_active = true