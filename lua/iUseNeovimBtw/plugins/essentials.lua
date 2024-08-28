return {
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
	{ "folke/lua-dev.nvim" }, -- Lua development
	{ "nvim-tree/nvim-web-devicons" },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "rcarriga/nvim-notify" },
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "jinh0/eyeliner.nvim" }, -- NOTE: helps navigate properly but already have hop??
	{ "numToStr/Comment.nvim" },
	-- {"karb94/neoscroll.nvim", opts = {}}, -- can be used for smooth scrolling
	-- { "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
}
