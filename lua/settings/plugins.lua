local fn = vim.fn

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

local plugins = {
  -- ESSENTIALS
  {"nvim-lua/popup.nvim"},-- An implementation of the Popup API from vim in Neovim
	{"nvim-lua/plenary.nvim"}, -- Useful lua functions used by lots of plugins
	{"folke/lua-dev.nvim"}, -- Lua development
  {"nvim-tree/nvim-web-devicons"}, 
  ("folke/twilight.nvim"), -- Dim inactive portions of the code you're editing

  -- COMPLETION
  {"hrsh7th/nvim-cmp"}, -- Autocompletion plugin
  {"hrsh7th/cmp-buffer"}, -- buffer completions
  {"hrsh7th/cmp-cmdline"}, -- cmdline completions
  {"hrsh7th/cmp-path"}, -- path completions
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-nvim-lua"},
  {"tzachar/cmp-tabnine", run='./install.sh'},
  {"L3MON4D3/LuaSnip"}, -- snippet engine

  -- LSP
  {'neovim/nvim-lspconfig'},             -- Required
  {'williamboman/mason.nvim'},           -- Optional
  {'williamboman/mason-lspconfig.nvim'},
  {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
      }
    },

  -- UI
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	{"nvim-tree/nvim-tree.lua"},
	{"nvim-telescope/telescope.nvim"},
	{"nvim-telescope/telescope-media-files.nvim"},
  {'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }},
	{"nvim-treesitter/nvim-treesitter"},

  -- Utilities
  {"Pocco81/auto-save.nvim"}, -- Automatically save current file(s)
  {'numToStr/Comment.nvim'},
  {"rcarriga/nvim-notify"}, -- A fancy, configurable, notification manager for NeoVim
  {"ThePrimeagen/harpoon"}, -- A mark and teleportation plugin for neovim
  {"folke/which-key.nvim"}, -- A lua implementation of the ever so popular which-key plugin for vim
	{"akinsho/toggleterm.nvim"}, -- Terminal
  {"goolord/alpha-nvim"}, -- front page of neovim
	{'smoka7/hop.nvim'}, -- Motion
  {"windwp/nvim-autopairs"}, -- Autopairs, integrates with both cmp and treesitter
  {"folke/trouble.nvim"}, -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
  {"kylechui/nvim-surround"},
	{"lvimuser/lsp-inlayhints.nvim"},
}

-- PLUGINS
local opts = {}
lazy.setup({ plugins, opts }, {
	checker = {
		enabled = true,
		notify = false,
	},
})
-- lazy.setup({
	--        [Undo Tree]
	-- "mbbill/undotree",

    -- THEMES
-- 	("lunarvim/darkplus.nvim")
	-- ("tanvirtin/monokai.nvim"),
  -- 	("NvChad/nvim-colorizer.lua")
  -- 	("xiyaowong/nvim-transparent")
  -- 	("ziontee113/color-picker.nvim")
  -- 	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- 	-- use "Mofiqul/dracula.nvim"
  -- 	-- use "lunarvim/darkplus.nvim"
  -- 	-- use "marko-cerovac/material.nvim"
  -- 	-- use 'navarasu/onedark.nvim'
  -- 	-- use { "catppuccin/nvim", as = "catppuccin" }

-- 	-- Completion
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = function ()
  --     require("copilot_cmp").setup({
  --       event = { "InsertEnter", "LspAttach" },
  --       fix_pairs = true,
  --     })
  --   end
  -- },  
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end,
  -- },
  -- {"saadparwaiz1/cmp_luasnip"}, -- snippet completions
  -- {"hrsh7th/cmp-emoji"},
  -- {"hrsh7th/cmp-vsnip"}, -- vsnip completions
  -- {"hrsh7th/vim-vsnip"}, -- vsnip
  -- {"rafamadriz/friendly-snippets"}, -- a bunch of snippets to use
  -- {"antoinemadec/FixCursorHold.nvim"}, -- This is needed to fix lsp doc highlight
-- 	("christianchiarulli/nvim-cmp")
-- 	("hrsh7th/cmp-buffer") -- buffer completions
-- 	("hrsh7th/cmp-path") -- path completions
-- 	("hrsh7th/cmp-cmdline") -- cmdline completions
-- 	("saadparwaiz1/cmp_luasnip") -- snippet completions
-- 	("hrsh7th/cmp-nvim-lsp")
-- 	("hrsh7th/cmp-emoji")
-- 	("hrsh7th/cmp-nvim-lua")
-- 	({ "tzachar/cmp-tabnine", commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e", run = "./install.sh" })
-- 	-- Github Copilot
-- 	{
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup({})
--   end,
-- }
--   {
--     "zbirenbaum/copilot-cmp",
--     after = { "copilot.lua" },
--     config = function ()
--       require("copilot_cmp").setup()
--     end
-- }
-- 	-- Debugging
-- 	("mfussenegger/nvim-dap")
-- 	("rcarriga/nvim-dap-ui")
-- 	-- use "Pocco81/dap-buddy.nvim"
-- 	-- use "theHamsta/nvim-dap-virtual-text"

-- 	-- BUFFER && tabline
-- 	("akinsho/bufferline.nvim") -- buffer
-- 	("moll/vim-bbye") -- delete buffers
-- 	("tiagovla/scope.nvim")
-- 	("ghillb/cybu.nvim")

-- 	-- Comment
-- 	("numToStr/Comment.nvim") -- Easily comment stuff
-- 	("folke/todo-comments.nvim")

-- 	-- Code Runner
-- 	("is0n/jaq-nvim")

-- 	-- Discord Rich Presence
-- 	("andweeb/presence.nvim")

-- 	-- Editing Support
-- 	("max397574/better-escape.nvim") -- using 'jk' to revert back to normal mode
-- 	("karb94/neoscroll.nvim") -- Smooth scrolling plugin
-- 	("nacro90/numb.nvim")
-- 	("andymass/vim-matchup")
-- 	("junegunn/vim-slash")

-- 	-- Git
-- 	("lewis6991/gitsigns.nvim")
-- 	("ruifm/gitlinker.nvim")

-- 	-- Icon
-- 	("kyazdani42/nvim-web-devicons")

-- 	-- Indent
-- 	("lukas-reineke/indent-blankline.nvim")

-- 	-- Keybinding
-- 	("folke/which-key.nvim")

-- 	-- Quickfix
-- 	("kevinhwang91/nvim-bqf")

-- 	-- Motion
-- 	("jinh0/eyeliner.nvim")
-- 	("phaazon/hop.nvim")

-- 	-- Project
-- 	("ahmedkhalf/project.nvim")

-- 	-- Registers
-- 	("tversteeg/registers.nvim")

-- 	-- surround
-- 	("kylechui/nvim-surround")
-- 	-- use("ur4ltz/surround.nvim")

-- 	-- Search and replace
-- 	("windwp/nvim-spectre")

-- 	-- Snippet
-- 	("L3MON4D3/LuaSnip") --snippet engine
-- 	("rafamadriz/friendly-snippets") -- a bunch of snippets to use
-- 	("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

-- 	-- Startup
-- 	("goolord/alpha-nvim") -- front page of neovim
-- 	("nathom/filetype.nvim")
-- 	("lewis6991/impatient.nvim")
-- 	-- STATUSLINE
-- 	-- use {
-- 	-- "nvim-lualine/lualine.nvim",
-- 	-- requires = { 'kyazdani42/nvim-web-devicons', opt = true },
-- 	-- }
-- 	("christianchiarulli/lualine.nvim")

-- 	-- Syntax/
-- 	("nvim-treesitter/nvim-treesitter")
-- 	-- use("JoosepAlviste/nvim-ts-context-commentstring")
-- 	-- use("p00f/nvim-ts-rainbow")
-- 	("nvim-treesitter/playground")
-- 	("windwp/nvim-ts-autotag")
-- 	("nvim-treesitter/nvim-treesitter-textobjects")
-- 	("romgrk/nvim-treesitter-context")
-- 	({
-- 		"abecodes/tabout.nvim",
-- 		wants = { "nvim-treesitter" }, -- or require if not used so far
-- 	})
-- 	-- use "wellle/targets.vim"
-- 	-- use "RRethy/nvim-treesitter-textsubjects"

-- 	-- Trouble
-- 	("folke/trouble.nvim")

-- 	-- Utility
-- 	("rcarriga/nvim-notify")
-- 	("stevearc/dressing.nvim")
-- 	("Pocco81/true-zen.nvim")
-- 	({ "christianchiarulli/JABS.nvim" })
-- 	("filipdutescu/renamer.nvim")
-- 	("unblevable/quick-scope")
-- 	("stevearc/aerial.nvim")
-- 	({ "michaelb/sniprun", run = "bash ./install.sh" })
-- 	({
-- 		"0x100101/lab.nvim",
-- 		run = "cd js && npm ci",
-- 	})

-- 	-- vim-tmux-navigator
-- 	("christoomey/vim-tmux-navigator")

-- 	-- Disabled Plugins
-- 	-- use("tom-anders/telescope-vim-bookmarks.nvim")
-- 	-- use("MattesGroeger/vim-bookmarks")
-- 	-- Note Taking
-- 	-- use("mickael-menu/zk-nvim")
-- 	-- git
-- 	-- use("f-person/git-blame.nvim")
-- 	-- use("mattn/vim-gist")
-- 	-- use("mattn/webapi-vim")
-- 	-- Github
-- 	-- use("pwntester/octo.nvim")
-- 	-- use("monaqa/dial.nvim")
-- 	-- use("folke/zen-mode.nvim")
-- 	("lalitmee/browse.nvim")
-- 	-- use("B4mbus/todo-comments.nvim")
-- 	-- Session
-- 	-- use("rmagatti/auto-session")
-- 	-- use("rmagatti/session-lens")
-- 	-- Java
-- 	-- use("mfussenegger/nvim-jdtls")
-- 	-- Rust
-- 	-- use({ "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" })
-- 	-- use("Saecki/crates.nvim")
-- 	-- -- Typescript TODO: set this up, also add keybinds to ftplugin
-- 	-- use("jose-elias-alvarez/typescript.nvim")
-- 	-- Markdown
-- 	-- use({
-- 	-- 	"iamcco/markdown-preview.nvim",
-- 	-- 	run = "cd app && npm install",
-- 	-- 	ft = "markdown",
-- 	-- })
-- 	-- Colorschemes
-- 	-- use("lunarvim/onedarker.nvim")
-- 	-- use "folke/tokyonight.nvim"
-- 	-- use "lunarvim/colorschemes"
-- 	-- use "mizlan/iswap.nvim"
-- 	-- use {'christianchiarulli/nvim-ts-rainbow'}
-- 	-- use "nvim-telescope/telescope-ui-select.nvim"
-- 	-- use "nvim-telescope/telescope-file-browser.nvim"
-- 	-- use 'David-Kunz/cmp-npm' -- doesn't seem to work
-- 	-- use "lunarvim/vim-solidity"
-- 	-- use "tpope/vim-repeat"
-- 	-- use "Shatur/neovim-session-manager"
-- 	-- use "metakirby5/codi.vim"
-- 	-- use { "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" }
-- 	-- use "rcarriga/cmp-dap"
-- 	-- use "https://github.com/rhysd/conflict-marker.vim"
-- 	-- use "rebelot/kanagawa.nvim"
-- 	-- use "gbprod/cutlass.nvim"
-- 	-- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
-- 	-- use "rmagatti/goto-preview"
-- 	-- use "nvim-lua/lsp_extensions.nvim"
-- 	-- use { "christianchiarulli/nvim-gps", branch = "text_hl" }
-- 	-- use "stevearc/stickybuf.nvim"
-- 	-- use "drybalka/tree-climber.nvim"

-- 	-- Automatically set up your configuration after cloning packer.nvim
-- 	-- Put this at the end after all plugins
-- 	-- if PACKER_BOOTSTRAP then
-- 	-- 	require("packer").sync()
-- 	-- end
-- })
-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])