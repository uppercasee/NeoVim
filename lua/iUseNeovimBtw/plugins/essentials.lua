return {
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
	{ "folke/lua-dev.nvim", event = "VeryLazy" }, -- Lua development
	{ "nvim-tree/nvim-web-devicons" },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "windwp/nvim-ts-autotag", event = "InsertEnter", opts = {} },
	{ "rcarriga/nvim-notify" },
	{ "lewis6991/gitsigns.nvim", opts = {}, event = "VeryLazy" },
	{ "famiu/bufdelete.nvim", event = "VeryLazy" },
	-- { "jinh0/eyeliner.nvim", event = "VeryLazy" }, -- NOTE: helps navigate properly but already have hop??
	-- {"karb94/neoscroll.nvim", opts = {}}, -- can be used for smooth scrolling
	-- { "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
}
