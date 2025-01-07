return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	lazy = true,
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "Harpoon" }, -- Load when `Harpoon` command is called
	setup = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
	settings = {
		save_on_toggle = true,
	},
}
