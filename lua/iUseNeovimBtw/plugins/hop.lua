local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<leader>gc", ":HopChar1<cr>", { silent = true, desc = "[G]o to [C]haracter" })
keymap("", "<leader>gl", ":HopLine<cr>", { silent = true, desc = "[G]o to [L]ine" })
keymap("", "<leader>gp", ":HopPattern<cr>", { silent = true, desc = "[G]o to [P]attern" })
keymap("", "<leader>gs", ":HopWordCurrentLine<cr>", { silent = true, desc = "[G]o to Current [S]entence" })
keymap("", "<leader>gw", ":HopWord<cr>", { silent = true, desc = "[G]o to [W]ord" })

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

return {
	"smoka7/hop.nvim",
	cmd = { "HopWord", "HopChar1", "HopChar2", "HopLine", "HopPattern", "HopWordCurrentLine" }, -- Load on specific commands
	config = function()
		local hop = require("hop")
		hop.setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
