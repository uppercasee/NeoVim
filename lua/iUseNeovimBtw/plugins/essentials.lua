return {
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
	-- { "folke/lua-dev.nvim", event = "VeryLazy" }, -- Lua development
	{ "nvim-tree/nvim-web-devicons" },
	{ "windwp/nvim-autopairs", lazy = true, event = "InsertEnter", config = true },
	{ "windwp/nvim-ts-autotag", lazy = true, event = "InsertEnter", opts = {} },
	{ "rcarriga/nvim-notify" },
	{ "lewis6991/gitsigns.nvim", opts = {}, event = "VeryLazy" },
	{ "famiu/bufdelete.nvim", event = "VeryLazy" },
	{ "karb94/neoscroll.nvim", opts = {} }, -- can be used for smooth scrolling
	-- { "stevearc/dressing.nvim", opts = {} },
}
