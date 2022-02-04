local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
-- return packer.startup(function(use)
return require('packer').startup(function()
   config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }   
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "kyazdani42/nvim-web-devicons" -- required for other plugins

  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-tree.lua" -- File explorer

  use "akinsho/bufferline.nvim" -- buffer
  use "lewis6991/impatient.nvim" -- boost startup
  use "moll/vim-bbye" -- delete buffers

  use "nathom/filetype.nvim" -- speed up startup time
   -- Statusline
   use {
    "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require("configs.lualine").config()
    end,
    -- disable = not config.enabled.lualine,
  }

  use "akinsho/toggleterm.nvim" -- terminal

  use "karb94/neoscroll.nvim" -- Smooth scrolling plugin

  use "Pocco81/AutoSave.nvim" -- Automatically save current file(s).

  -- use "ahmedkhalf/project.nvim"
  use "goolord/alpha-nvim"
  -- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  -- use "folke/which-key.nvim"

  -- discord rich preesence
  use "andweeb/presence.nvim"

  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "Mofiqul/dracula.nvim"
  use "tanvirtin/monokai.nvim"
  use "marko-cerovac/material.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "glepnir/lspsaga.nvim" -- lspsaga

  -- for AutoCompletion
  use {"ms-jpq/coq_nvim", branch ="coq"}
  use {"ms-jpq/coq.artifacts", branch = "artifacts"}

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- colorizer
  use "norcalli/nvim-colorizer.lua"

  -- indentline
  use "lukas-reineke/indent-blankline.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- symbols outline
  use "simrat39/symbols-outline.nvim"

    -- lua with packer.nvim
  use "max397574/better-escape.nvim"

    -- trouble
    use "folke/trouble.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
