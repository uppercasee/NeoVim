return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		event = "VimEnter",  -- Load on VimEnter
		opts = {
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			background = { dark = "mocha" },
		},
		config = function()
			vim.cmd("colorscheme catppuccin")
		end,
	},
	{ "tanvirtin/monokai.nvim", lazy=true},
	{ "Mofiqul/dracula.nvim" , lazy=true},
	{ "lunarvim/darkplus.nvim" , lazy=true},
	{ "lunarvim/colorschemes" , lazy=true},
	{ "navarasu/onedark.nvim" , lazy=true},
}
