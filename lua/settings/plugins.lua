local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	-- snapshot = "july-24",
	snapshot_path = fn.stdpath("config") .. "/snapshots",
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded", -- Border style of prompt popups.
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Plugin Mangager
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Essentials
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("folke/lua-dev.nvim")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("ray-x/lsp_signature.nvim")
	use("SmiteshP/nvim-navic")
	use("simrat39/symbols-outline.nvim")
	use("b0o/SchemaStore.nvim")
	use("RRethy/vim-illuminate")
	use("lvimuser/lsp-inlayhints.nvim")
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
	-- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use("j-hui/fidget.nvim")
	-- use "simrat39/inlay-hints.nvim"

	-- Completion
	use("christianchiarulli/nvim-cmp")
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use("zbirenbaum/copilot-cmp")
	use({ "tzachar/cmp-tabnine", commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e", run = "./install.sh" })

	-- Debugging
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	-- use "Pocco81/dap-buddy.nvim"
	-- use "theHamsta/nvim-dap-virtual-text"

	-- Snippet
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Autosave
	use("Pocco81/auto-save.nvim") -- Automatically save current file(s).

	-- Syntax/Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({
		"abecodes/tabout.nvim",
		wants = { "nvim-treesitter" }, -- or require if not used so far
	})
	-- use "wellle/targets.vim"
	-- use "RRethy/nvim-treesitter-textsubjects"
	-- surround
	use("kylechui/nvim-surround")
	-- Marks
	use("christianchiarulli/harpoon")

	-- Fuzzy Finder/Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Color
	use("NvChad/nvim-colorizer.lua")
	use("ziontee113/color-picker.nvim")
	use("xiyaowong/nvim-transparent")

	-- Colorschemes
	use("lunarvim/darkplus.nvim")
	use("tanvirtin/monokai.nvim")

	-- Utility
	use("rcarriga/nvim-notify")
	use("moll/vim-bbye")
	use("stevearc/dressing.nvim")
	use("ghillb/cybu.nvim")

	-- Icon
	use("kyazdani42/nvim-web-devicons")

	-- Statusline
	use("christianchiarulli/lualine.nvim")

	-- Startup
	use("goolord/alpha-nvim")
	use("nathom/filetype.nvim")
	use("lewis6991/impatient.nvim")

	-- Indent
	use("lukas-reineke/indent-blankline.nvim")

	-- File Explorer
	use("kyazdani42/nvim-tree.lua")

	-- Comment
	use("numToStr/Comment.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Quickfix
	use("kevinhwang91/nvim-bqf")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("ruifm/gitlinker.nvim")

	-- Editing Support
	use("max397574/better-escape.nvim")
	use("windwp/nvim-autopairs")
	use("karb94/neoscroll.nvim")
	use("nacro90/numb.nvim")
	use("andymass/vim-matchup")
	use("junegunn/vim-slash")

	-- Keybinding
	use("folke/which-key.nvim")

	-- Discord Rich Presence
	use("andweeb/presence.nvim")

	-- Trouble
	use("folke/trouble.nvim")

	-- Registers
	use("tversteeg/registers.nvim")
	-- Tabline
	-- use("akinsho/bufferline.nvim")
	use("tiagovla/scope.nvim")
	-- Motion
	use "jinh0/eyeliner.nvim"
	use("phaazon/hop.nvim")
	-- use "github/copilot.vim"
	use({
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot")
			end, 100)
		end,
	})
	-- Comments
	use("folke/todo-comments.nvim")
	-- Project
	use("windwp/nvim-spectre")
	-- Code Runner
	use("is0n/jaq-nvim")
	use("Pocco81/true-zen.nvim")
	use("romgrk/nvim-treesitter-context")
	use({ "christianchiarulli/JABS.nvim" })
	use("filipdutescu/renamer.nvim")
	use("unblevable/quick-scope")
	use("christianchiarulli/lsp-inlay-hints")
	use("stevearc/aerial.nvim")
	use({ "michaelb/sniprun", run = "bash ./install.sh" })




	-- Disabled Plugins
	-- use("tom-anders/telescope-vim-bookmarks.nvim")
	-- use("MattesGroeger/vim-bookmarks")
	-- Note Taking
	-- use("mickael-menu/zk-nvim")
	-- git
	-- use("f-person/git-blame.nvim")
	-- use("mattn/vim-gist")
	-- use("mattn/webapi-vim")
	-- Github
	-- use("pwntester/octo.nvim")
	-- use("monaqa/dial.nvim")
	-- use("folke/zen-mode.nvim")
	-- use("lalitmee/browse.nvim")
	-- Project
	-- use("ahmedkhalf/project.nvim")
	-- Comments
	-- use("B4mbus/todo-comments.nvim")
	-- Session
	-- use("rmagatti/auto-session")
	-- use("rmagatti/session-lens")
	-- use({
	-- 	"0x100101/lab.nvim",
	-- 	run = "cd js && npm ci",
	-- })
	-- Java
	-- use("mfussenegger/nvim-jdtls")
	-- Rust
	-- use({ "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" })
	-- use("Saecki/crates.nvim")
	-- -- Typescript TODO: set this up, also add keybinds to ftplugin
	-- use("jose-elias-alvarez/typescript.nvim")
	-- Markdown
	-- use({
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = "cd app && npm install",
	-- 	ft = "markdown",
	-- })
	-- Colorschemes
	-- use("lunarvim/onedarker.nvim")
	-- use "folke/tokyonight.nvim"
	-- use "lunarvim/colorschemes"

	-- use "mizlan/iswap.nvim"
	-- use {'christianchiarulli/nvim-ts-rainbow'}
	-- use "nvim-telescope/telescope-ui-select.nvim"
	-- use "nvim-telescope/telescope-file-browser.nvim"
	-- use 'David-Kunz/cmp-npm' -- doesn't seem to work
	-- use "lunarvim/vim-solidity"
	-- use "tpope/vim-repeat"
	-- use "Shatur/neovim-session-manager"
	-- use "metakirby5/codi.vim"
	-- use { "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" }
	-- use "rcarriga/cmp-dap"
	-- use "https://github.com/rhysd/conflict-marker.vim"
	-- use "rebelot/kanagawa.nvim"
	-- use "gbprod/cutlass.nvim"
	-- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
	-- use "rmagatti/goto-preview"
	-- use "nvim-lua/lsp_extensions.nvim"
	-- use { "christianchiarulli/nvim-gps", branch = "text_hl" }
	-- use "stevearc/stickybuf.nvim"
	-- use "drybalka/tree-climber.nvim"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
