local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify(
		"[WARNING] treesitter.config module not found. treesitter support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

configs.setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})
-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- ft_to_parser.motoko = "typescript"

-- configs.setup({
-- 	ensure_installed = "all", -- one of "all" or a list of languages
-- 	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
-- 	ignore_install = { "" }, -- List of parsers to ignore installing
-- 	matchup = {
-- 		enable = true, -- mandatory, false will disable the whole extension
-- 		disable_virtual_text = true,
-- 		disable = { "html" }, -- optional, list of language that will be disabled
-- 		-- include_match_words = false
-- 	},
-- 	highlight = {
-- 		-- use_languagetree = true,
-- 		enable = true, -- false will disable the whole extension
-- 		-- disable = { "css", "html" }, -- list of language that will be disabled
-- 		-- disable = { "css", "markdown" }, -- list of language that will be disabled
-- 		disable = { "markdown" }, -- list of language that will be disabled
-- 		-- additional_vim_regex_highlighting = true,
-- 	},
-- 	autopairs = {
-- 		enable = true,
-- 	},
-- 	indent = { enable = true, disable = { "python", "css", "rust" } },
-- 	context_commentstring = {
-- 		enable = true,
-- 		enable_autocmd = false,
-- 	},
-- 	autotag = {
-- 		enable = true,
-- 		disable = { "xml", "markdown" },
-- 	},
-- 	rainbow = {
-- 		enable = true,
-- 		extended_mode = false,
-- 		colors = {
-- 			-- "#68a0b0",
-- 			-- "#946EaD",
-- 			-- "#c7aA6D",
-- 			"Gold",
-- 			"Orchid",
-- 			"DodgerBlue",
-- 			-- "Cornsilk",
-- 			-- "Salmon",
-- 			-- "LawnGreen",
-- 		},
-- 		disable = { "html" },
-- 	},
-- 	playground = {
-- 		enable = true,
-- 	},
-- 	textobjects = {
-- 		select = {
-- 			enable = true,
-- 			-- Automatically jump forward to textobj, similar to targets.vim
-- 			lookahead = true,
-- 			keymaps = {
-- 				-- You can use the capture groups defined in textobjects.scm
-- 				["af"] = "@function.outer",
-- 				["if"] = "@function.inner",
-- 				["at"] = "@class.outer",
-- 				["it"] = "@class.inner",
-- 				["ac"] = "@call.outer",
-- 				["ic"] = "@call.inner",
-- 				["aa"] = "@parameter.outer",
-- 				["ia"] = "@parameter.inner",
-- 				["al"] = "@loop.outer",
-- 				["il"] = "@loop.inner",
-- 				["ai"] = "@conditional.outer",
-- 				["ii"] = "@conditional.inner",
-- 				["a/"] = "@comment.outer",
-- 				["i/"] = "@comment.inner",
-- 				["ab"] = "@block.outer",
-- 				["ib"] = "@block.inner",
-- 				["as"] = "@statement.outer",
-- 				["is"] = "@scopename.inner",
-- 				["aA"] = "@attribute.outer",
-- 				["iA"] = "@attribute.inner",
-- 				["aF"] = "@frame.outer",
-- 				["iF"] = "@frame.inner",
-- 			},
-- 		},
-- 		move = {
-- 			enable = true,
-- 			set_jumps = true, -- whether to set jumps in the jumplist
-- 			goto_next_start = {
-- 				["]m"] = "@function.outer",
-- 				["]]"] = "@class.outer",
-- 			},
-- 			goto_next_end = {
-- 				["]M"] = "@function.outer",
-- 				["]["] = "@class.outer",
-- 			},
-- 			goto_previous_start = {
-- 				["[m"] = "@function.outer",
-- 				["[["] = "@class.outer",
-- 			},
-- 			goto_previous_end = {
-- 				["[M"] = "@function.outer",
-- 				["[]"] = "@class.outer",
-- 			},
-- 		},
-- 		swap = {
-- 			enable = true,
-- 			swap_next = {
-- 				["<leader>."] = "@parameter.inner",
-- 			},
-- 			swap_previous = {
-- 				["<leader>,"] = "@parameter.inner",
-- 			},
-- 		},
-- 	},
-- })
