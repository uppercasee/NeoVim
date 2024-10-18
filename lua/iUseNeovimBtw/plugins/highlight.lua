return {
	"brenoprata10/nvim-highlight-colors",
	setup = function()
		local highlight_colors = require("nvim-highlight-colors")
		highlight_colors.setup({
			enable_tailwind = true,
		})
	end,
}
