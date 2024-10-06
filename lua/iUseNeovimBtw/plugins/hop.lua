local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<leader>hl", ":HopWordCurrentLine<cr>", { silent = true, desc = "[H]op Current [L]ine" })
keymap("", "<leader>hp", ":HopPattern<cr>", { silent = true, desc = "[H]op [P]attern" })

return {
	"smoka7/hop.nvim",
	cmd = { "HopWord", "HopChar1", "HopChar2", "HopLine", "HopPattern", "HopWordCurrentLine" }, -- Load on specific commands
	config = function()
		local hop = require("hop")
		hop.setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
