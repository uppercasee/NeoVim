<div align="center">
<p>
    <a>
      <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black" />
    </a>
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
      <img src="https://img.shields.io/badge/Neovim-0.9.1-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" alt="Neovim minimum version"/>
    </a>
    <!-- <a href="https://github.com/uppercasee/NeoVim/commits">
      <img src="https://badgen.net/github/commits/uppercasee/NeoVim" alt="Commit number" />
    </a> -->
    <a href="https://github.com/uppercasee/NeoVim/issues">
      <img src="https://badgen.net/github/issues/uppercasee/NeoVim" alt="Issues" />
    </a>
    <a href="https://github.com/uppercasee/NeoVim/pulls">
      <img src="https://badgen.net/github/prs/uppercasee/NeoVim" alt="Prs" />
    </a>
    <a href="https://github.com/uppercasee/NeoVim/search?l=vim-script">
      <img src="https://img.shields.io/github/languages/top/uppercasee/NeoVim" alt="Top languages"/>
    </a>
    <a href="https://github.com/uppercasee/NeoVim/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/uppercasee/NeoVim?style=flat-square&logo=GNU&label=License" alt="License"/>
    </a>
</p>
</div>

# [NeoVim]("https://neovim.io/") Configuration:

This is my Neovim configuration, customized to suit my workflow and preferences. I've included various plugins to enhance my coding experience. Feel free to use this configuration as a starting point for your own Neovim setup.

## Installation

1. Make sure you have [Neovim]("https://github.com/neovim/neovim/wiki/Installing-Neovim") installed on your system.

2. Clone this repository to your Neovim configuration directory. Typically, this directory is located at `~/.config/nvim/`.

   ```bash
   git clone https://github.com/uppercasee/NeoVim.git ~/.config/nvim
   ```

3. Install [Packer.nvim](https://github.com/wbthomason/packer.nvim), the plugin manager used in this configuration.

4. Launch Neovim and run the following command to install the plugins:

   ```vim
   :PackerInstall
   ```

## Key Plugins

Here are some of the key plugins included in this configuration:

### Language Server Protocol (LSP)

- [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim): An implementation of the Popup API from Vim in Neovim.
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): LSP configuration for Neovim.
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim): Formatters and linters.
- [SmiteshP/nvim-navic](https://github.com/SmiteshP/nvim-navic): Neovim code navigation.

### Completion

- [christianchiarulli/nvim-cmp](https://github.com/christianchiarulli/nvim-cmp): Code completion.
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer): Buffer completions.
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path): Path completions.
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline): Command-line completions.
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip): Snippet completions.

#### Github Copilot

- [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua): Github Copilot integration.

### Syntax/Treesitter

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Syntax highlighting and parsing.
- [nvim-treesitter/playground](https://github.com/nvim-treesitter/playground): Treesitter playground.
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag): Autotagging for Treesitter.

### Fuzzy Finder/Telescope

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Fuzzy finder and live search.
- [nvim-telescope/telescope-media-files.nvim](https://github.com/nvim-telescope/telescope-media-files.nvim): Media file finder.

### Git

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git signs and status.
- [ruifm/gitlinker.nvim](https://github.com/ruifm/gitlinker.nvim): Easily generate shareable GitHub links.

### Autosave

- [Pocco81/auto-save.nvim](https://github.com/Pocco81/auto-save.nvim): Automatically save current file(s).




<!-- + Plugin management via [Packer.nvim](https://github.com/wbthomason/packer.nvim).
+ Code, snippet, word auto-completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
+ Language server protocol (LSP) support via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
+ Git integration via [vim-fugitive](https://github.com/tpope/vim-fugitive).
+ Better escaping from insert mode via [better-escape.vim](https://github.com/jdhao/better-escape.vim).
+ Faster code commenting via [vim-commentary](https://github.com/tpope/vim-commentary).
+ Fast buffer jump via [hop.nvim](https://github.com/phaazon/hop.nvim).
+ Beautiful statusline via [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
+ File tree explorer via [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua).
+ Better quickfix list with [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf).
+ User-defined mapping hint via [which-key.nvim](https://github.com/folke/which-key.nvim).
+ Code highlighting via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
+ Animated GUI style notification via [nvim-notify](https://github.com/rcarriga/nvim-notify).
+ Smooth scroll experience via [neoscroll](https://github.com/karb94/neoscroll.nvim). -->
<!-- + Ultra-fast project-wide fuzzy searching via [LeaderF](https://github.com/Yggdroot/LeaderF). -->
<!-- + Faster matching pair insertion and jump via [delimitMate](https://github.com/Raimondi/delimitMate). -->
<!-- + Smarter and faster matching pair management (add, replace or delete) via [vim-sandwich](https://github.com/machakann/vim-sandwich). -->
<!-- + Powerful snippet insertion via [Ultisnips](https://github.com/SirVer/ultisnips). -->
<!-- + Show search index and count with [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens). -->
<!-- + Command line auto-completion via [wilder.nvim](https://github.com/gelguy/wilder.nvim). -->
<!-- + Asynchronous code execution via [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim). -->
<!-- + Code editing using true nvim inside browser via [firenvim](https://github.com/glacambre/firenvim). -->
<!-- + Color theme via [vim-gruvbox8](https://github.com/lifepillar/vim-gruvbox8) and other beautiful themes. -->
<!-- + Markdown writing and previewing via [vim-markdown](https://github.com/plasticboy/vim-markdown) and [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim). -->
<!-- + LaTeX editing and previewing via [vimtex](https://github.com/lervag/vimtex) <sup id="a1">[1](#f1)</sup>. -->
<!-- + Tags navigation via [vista](https://github.com/liuchengxu/vista.vim). -->
<!-- + Code formatting via [Neoformat](https://github.com/sbdchd/neoformat). -->
<!-- + Undo management via [vim-mundo](https://github.com/simnalamburt/vim-mundo) -->

## Dependencies

Before using this Neovim configuration, make sure you have the following dependencies installed on your system:

1. **Neovim**: Neovim is the core editor that this configuration is built upon. You can download it from the official [Neovim website](https://neovim.io/).
2. **Packer.nvim**: Packer.nvim is the plugin manager used in this configuration. 
3. **Node.js**: Some plugins may require Node.js for additional functionality. You can download Node.js from the official [Node.js website](https://nodejs.org/).
4. **Npm**: If you're using Node.js, you'll also need npm (Node Package Manager). It comes bundled with Node.js installation.
5. **Python (optional)**: Certain Neovim plugins, especially those related to LSP, might require Python support. You can install Python from the [official Python website](https://www.python.org/).
6. **Git**: Git is essential for managing plugin installations and version control. You can download Git from the [official Git website](https://git-scm.com/).
7. **CMake (optional)**: Some LSP-related plugins may require CMake for building. You can install CMake from the [official CMake website](https://cmake.org/).
8. **ripgrep**: Ripgrep is a fast text search tool that is often used by Neovim plugins for searching within code. You can install it from the [official Ripgrep website](https://github.com/BurntSushi/ripgrep).
9. **shellcheck**: ShellCheck is a static analysis tool for shell scripts. It can be used for linting shell scripts within Neovim. You can install it from the [official ShellCheck website](https://github.com/koalaman/shellcheck).
10. **stylua**: Stylua is a Lua code formatter used for formatting Lua scripts. You can install it using Cargo, the Rust package manager:

    ```shell
    cargo install stylua
    ```
11. **black**: Black is a Python code formatter. You can install it using pip, the Python package manager:

    ```shell
    pip install black
    ```

## Contributing

If you find anything that needs improving, do not hesitate to point it out or create a PR.

If you come across an issue, you can first use `:checkhealth` command provided by `nvim` to trouble-shoot yourself.
Please read carefully the messages provided by health check.

If you still have an issue, [open a new issue](https://github.com/uppercasee/NeoVim/issues).

### TODO:
- [ ] idk, Too many things
