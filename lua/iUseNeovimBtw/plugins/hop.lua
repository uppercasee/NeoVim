local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<leader>gc", ":HopChar1<cr>", { silent = true, desc = "[G]o to [C]haracter" })
keymap("", "<leader>gl", ":HopLine<cr>", { silent = true, desc = "[G]o to [L]ine" })
keymap("", "<leader>gp", ":HopPattern<cr>", { silent = true, desc = "[G]o to [P]attern" })
keymap("", "<leader>gs", ":HopWordCurrentLine<cr>", { silent = true, desc = "[G]o to Current [S]entence" })
keymap("", "<leader>gw", ":HopWord<cr>", { silent = true, desc = "[G]o to [W]ord" })

return {
	"smoka7/hop.nvim",
	cmd = { "HopWord", "HopChar1", "HopChar2", "HopLine", "HopPattern", "HopWordCurrentLine" }, -- Load on specific commands
	config = function()
		local hop = require("hop")
		hop.setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
