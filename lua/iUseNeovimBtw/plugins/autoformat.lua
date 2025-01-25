return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = true,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "biome", "eslint" },
				typescript = { "biome", "eslint" },
				typescriptreact = { "biome", "eslint" },
				javascriptreact = { "biome", "eslint" },
				rust = { "rustfmt" },
				go = { "gofmt" },
				markdown = { "markdownlint" },
			},
		},
	},
}
