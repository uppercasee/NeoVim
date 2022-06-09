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
  -- PACKER AND ITS REQUIREMENTS
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "kyazdani42/nvim-web-devicons" -- required for other plugins

  -- BOOST SPEEDUPTIME
  use "lewis6991/impatient.nvim" -- boost startup
  use "nathom/filetype.nvim" -- speed up startup time

  -- COLORSCHEMES PLUGINS
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "Mofiqul/dracula.nvim"
  use "tanvirtin/monokai.nvim"
  use "marko-cerovac/material.nvim"
  
  -- CMP AUTOCOMPLETION PLUGINS
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- OTHER PLUGINS
  use "goolord/alpha-nvim" -- front page of neovim
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "Pocco81/AutoSave.nvim" -- Automatically save current file(s).

  use "max397574/better-escape.nvim"
  
  -- BUFFER
  use "akinsho/bufferline.nvim" -- buffer
  use "moll/vim-bbye" -- delete buffers

  -- COLORIZER && COMMENT
  use "norcalli/nvim-colorizer.lua"
  use "numToStr/Comment.nvim" -- Easily comment stuff

  -- GIT
  use "lewis6991/gitsigns.nvim"

  -- INDENTLINE
  use "lukas-reineke/indent-blankline.nvim"

   -- STATUSLINE
  use {
  "nvim-lualine/lualine.nvim",
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require("configs.lualine").config()
  end,
  -- disable = not config.enabled.lualine,
  }

  use "karb94/neoscroll.nvim" -- Smooth scrolling plugin

  -- FILE EXPLORER
  use "kyazdani42/nvim-tree.lua"

  -- DISCORD RICH PRESENCE
  use "andweeb/presence.nvim"

  -- TELESCOPE
  use "nvim-telescope/telescope.nvim"
  
  -- TERMINAL && TROUBLE
  use "akinsho/toggleterm.nvim"
  use "folke/trouble.nvim"
  
  -- TREESITTER
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- WHICHKEY
  use "folke/which-key.nvim"

  -- LSP
  -- use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  -- use "glepnir/lspsaga.nvim" -- lspsaga

  -- SYMBOLS OUTLINE (LSP)
  use "simrat39/symbols-outline.nvim"
  
  -- SNIPPETS
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  
  -- UNUSED PLUGINS --

  -- use "ahmedkhalf/project.nvim"
  -- use {"nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope" }

  -- for AutoCompletion
  -- use {"ms-jpq/coq_nvim", branch ="coq"}
  -- use {"ms-jpq/coq.artifacts", branch = "artifacts"}
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
