return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- priority = 1000,
		-- event = "VimEnter", -- Load on VimEnter
		-- opts = {
		-- 	flavour = "macchiato", -- latte, frappe, macchiato, mocha
		-- 	background = { dark = "mocha" },
		-- },
		-- config = function()
		-- 	vim.cmd("colorscheme catppuccin")
		-- end,
	},
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		event = "VimEnter",
		config = function()
			vim.cmd("colorscheme dracula")
		end,
	},
	{ "tanvirtin/monokai.nvim" },
	{ "lunarvim/darkplus.nvim" },
	{ "lunarvim/colorschemes" },
	{ "navarasu/onedark.nvim" },
}
