return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		lazy = false,
		opts = {
			ensure_installed = {
				"javascript", "typescript", "c", "cpp", "python", "rust", "lua", "go", "bash",
				"json", "html", "css", "yaml", "toml", "make", "markdown", "dockerfile",
				"vim", "regex", "graphql", "comment", "gitcommit", "vimdoc", "tsx", "jsdoc",
			},
			sync_install = false,
			auto_install = true,
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
		},
	}
}