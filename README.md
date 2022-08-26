<div align="center">
<p>
    <a>
      <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black" />
    </a>
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
      <img src="https://img.shields.io/badge/Neovim-0.7.2-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" alt="Neovim minimum version"/>
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

## My [NeoVim]("https://neovim.io/") config:

### Install and setup #

See [here]("https://github.com/neovim/neovim/wiki/Installing-Neovim") on how to install Neovim and setup on your device.

## Features

+ Plugin management via [Packer.nvim](https://github.com/wbthomason/packer.nvim).
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
+ Smooth scroll experience via [neoscroll](https://github.com/karb94/neoscroll.nvim).
+ ......
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

- ripgrep
- shellcheck
- stylua
- black

## Contributing

If you find anything that needs improving, do not hesitate to point it out or create a PR.

If you come across an issue, you can first use `:checkhealth` command provided by `nvim` to trouble-shoot yourself.
Please read carefully the messages provided by health check.

If you still have an issue, [open a new issue](https://github.com/uppercasee/NeoVim/issues).

### TODO:
- [ ] LSP
- [ ] Completion(cmp)
- [ ] Treesitter
