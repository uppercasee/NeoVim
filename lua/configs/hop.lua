local status_ok, hop = pcall(require, "hop")
if not status_ok then
	vim.notify("[WARNING] hop module not found. hop support disabled.", vim.log.levels.WARN, { title = "Nvim-config" })
	return
end
hop.setup{ keys = 'etovxqpdygfblzhckisuran' }

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<leader>L", ":HopWordCurrentLine<cr>", { silent = true })
-- keymap("", "S", ":HopChar2<cr>", { silent = true })
-- keymap("", "Q", ":HopPattern<cr>", { silent = true })
keymap("", "<leader>H", ":HopPattern<cr>", { silent = true })
-- keymap("", "H", ":HopChar2<cr>", { silent = true })

keymap(
	"o",
	"f",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>",
	opts
)
keymap(
	"o",
	"F",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>",
	opts
)
keymap(
	"o",
	"t",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>",
	opts
)
keymap(
	"o",
	"T",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>",
	opts
)

keymap(
	"n",
	"f",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>",
	opts
)
keymap(
	"n",
	"F",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>",
	opts
)
keymap(
	"n",
	"t",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false})<CR>",
	opts
)
keymap(
	"n",
	"T",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false})<CR>",
	opts
)
