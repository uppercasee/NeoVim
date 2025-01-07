return {
	"brenoprata10/nvim-highlight-colors",
	lazy = true,
	keys = {
		{
			"<leader>bt",
			function()
				require("nvim-highlight-colors").toggle()
			end,
			mode = "n",
			desc = "[B]uffer Highlight [T]oggle",
		},
		{
			"<leader>bf",
			function()
				require("nvim-highlight-colors").turnOff()
			end,
			mode = "n",
			desc = "[B]uffer Highlight Color O[f]f",
		},
		{
			"<leader>bc",
			function()
				require("nvim-highlight-colors").turnOn()
			end,
			mode = "n",
			desc = "[B]uffer Highlight [C]olor On",
		},
	},
	setup = function()
		local highlight_colors = require("nvim-highlight-colors")
		highlight_colors.setup({
			enable_tailwind = true,
		})
	end,
}
