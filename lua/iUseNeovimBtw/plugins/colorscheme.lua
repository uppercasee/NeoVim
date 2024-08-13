return {
	{ 
		"catppuccin/nvim", 
		name = "catppuccin", 
		priority = 1000, 
		opts={
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			background = { dark = "mocha" } 
		},
		config = function()
			vim.cmd("colorscheme catppuccin")
		  end
	},
	{"tanvirtin/monokai.nvim"},
	{"Mofiqul/dracula.nvim"},
	{"lunarvim/darkplus.nvim"},
	{"lunarvim/colorschemes"},
	{'navarasu/onedark.nvim'},
}