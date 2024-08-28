return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	setup = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
	settings = {
		save_on_toggle = true,
	},
}
