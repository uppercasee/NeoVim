local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<leader>gl", ":HopWordCurrentLine<cr>", { silent = true, desc = "[G]o to Current [L]ine" })
keymap("", "<leader>gp", ":HopPattern<cr>", { silent = true, desc = "[G]o to [P]attern" })

return {
	"smoka7/hop.nvim",
	cmd = { "HopWord", "HopChar1", "HopChar2", "HopLine", "HopPattern", "HopWordCurrentLine" }, -- Load on specific commands
	config = function()
		local hop = require("hop")
		hop.setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
