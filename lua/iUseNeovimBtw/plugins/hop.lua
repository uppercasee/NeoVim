local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<leader>gc", ":HopChar1<cr>", { silent = true, desc = "[G]o to [C]haracter" })
keymap("", "<leader>gl", ":HopLine<cr>", { silent = true, desc = "[G]o to [L]ine" })
keymap("", "<leader>gp", ":HopPattern<cr>", { silent = true, desc = "[G]o to [P]attern" })
keymap("", "<leader>gs", ":HopWordCurrentLine<cr>", { silent = true, desc = "[G]o to Current [S]entence" })
keymap("", "<leader>gg", ":HopWord<cr>", { silent = true, desc = "[G]o to [w]ord" })

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

return {
	"smoka7/hop.nvim",
	cmd = { "HopWord", "HopChar1", "HopChar2", "HopLine", "HopPattern", "HopWordCurrentLine" }, -- Load on specific commands
	opts = {
		keys = "etovxqpdygfblzhckisuran",
	},
}
