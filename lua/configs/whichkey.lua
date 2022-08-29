local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	vim.notify(
		"[WARNING] whichkey module not found. which-key support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		["<leader>"] = "SPC",
		-- ["<CR>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = false, -- show help message on the command line when the popup is visible
	-- triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local m_opts = {
	mode = "n", -- NORMAL mode
	prefix = "m",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local m_mappings = {
	a = { "<cmd>silent BookmarkAnnotate<CR>", "Annotate" },
	c = { "<cmd>silent BookmarkClear<CR>", "Clear" },
	b = { "<cmd>silent BookmarkToggle<CR>", "Toggle" },
	m = { '<cmd>lua require("harpoon.mark").add_file()<CR>', "Harpoon" },
	["."] = { '<cmd>lua require("harpoon.ui").nav_next()<CR>', "Harpoon Next" },
	[","] = { '<cmd>lua require("harpoon.ui").nav_prev()<CR>', "Harpoon Prev" },
	l = { "<cmd>lua require('user.bfs').open()<CR>", "Buffers" },
	j = { "<cmd>silent BookmarkNext<CR>", "Next" },
	s = { "<cmd>Telescope harpoon marks<CR>", "Search Files" },
	k = { "<cmd>silent BookmarkPrev<CR>", "Prev" },
	S = { "<cmd>silent BookmarkShowAll<CR>", "Prev" },
	-- s = {
	--   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<CR>",
	--   "Show",
	-- },
	x = { "<cmd>BookmarkClearAll<CR>", "Clear All" },
	[";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', "Harpoon UI" },
}

local mappings = {
	-- ["1"] = "which_key_ignore",
	a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Action" },
	e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
	v = { "<cmd>vsplit<CR>", "vsplit" },
	-- h = { "<cmd>split<CR>", "split" },
	w = { "<cmd>w<CR>", "Write" },
	h = { "<cmd>nohlsearch<CR>", "No HL" },
	q = { '<cmd>lua require("user.functions").smart_quit()<CR>', "Quit" },
	["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },
	-- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },

	-- :lua require'lir.float'.toggle()
	-- ["f"] = {
	--   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
	--   "Find files",
	-- },
	-- ["F"] = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" },
	-- P = { "<cmd>lua require('telescope').extensions.projects.projects()<CR>", "Projects" },
	-- ["R"] = { '<cmd>lua require("renamer").rename()<CR>', "Rename" },
	-- ["z"] = { "<cmd>ZenMode<CR>", "Zen" },
	["gy"] = "Link",

	b = {
		name = "Buffer",
		b = { "<cmd>Telescope buffers<CR>", "Buffers" },
		c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	},

	B = {
		name = "Browse",
		i = { "<cmd>BrowseInputSearch<CR>", "Input Search" },
		b = { "<cmd>Browse<CR>", "Browse" },
		B = { "<cmd>BrowseBookmarks<cr>", "Input Search" },
		d = { "<cmd>BrowseDevdocsSearch<CR>", "Devdocs" },
		f = { "<cmd>BrowseDevdocsFiletypeSearch<CR>", "Devdocs Filetype" },
		m = { "<cmd>BrowseMdnSearch<CR>", "Mdn" },
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<CR>", "Compile" },
		i = { "<cmd>PackerInstall<CR>", "Install" },
		s = { "<cmd>PackerSync<CR>", "Sync" },
		S = { "<cmd>PackerStatus<CR>", "Status" },
		u = { "<cmd>PackerUpdate<CR>", "Update" },
	},

	o = {
		name = "Options",
		c = { "<cmd>lua vim.g.cmp_active=false<CR>", "Completion off" },
		C = { "<cmd>lua vim.g.cmp_active=true<CR>", "Completion on" },
		w = { '<cmd>lua require("user.functions").toggle_option("wrap")<CR>', "Wrap" },
		r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<CR>', "Relative" },
		l = { '<cmd>lua require("user.functions").toggle_option("cursorline")<CR>', "Cursorline" },
		s = { '<cmd>lua require("user.functions").toggle_option("spell")<CR>', "Spell" },
		t = { '<cmd>lua require("user.functions").toggle_tabline()<CR>', "Tabline" },
	},

	-- s = {
	--   name = "Split",
	--   s = { "<cmd>split<CR>", "HSplit" },
	--   v = { "<cmd>vsplit<CR>", "VSplit" },
	-- },

	r = {
		name = "Replace",
		r = { "<cmd>lua require('spectre').open()<CR>", "Replace" },
		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Replace Word" },
		f = { "<cmd>lua require('spectre').open_file_search()<CR>", "Replace Buffer" },
	},

	d = {
		name = "Debug",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
		i = { "<cmd>lua require'dap'.step_into()<CR>", "Into" },
		o = { "<cmd>lua require'dap'.step_over()<CR>", "Over" },
		O = { "<cmd>lua require'dap'.step_out()<CR>", "Out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Repl" },
		l = { "<cmd>lua require'dap'.run_last()<CR>", "Last" },
		u = { "<cmd>lua require'dapui'.toggle()<CR>", "UI" },
		x = { "<cmd>lua require'dap'.terminate()<CR>", "Exit" },
	},

	-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
	-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
	-- require("dapui").open()
	-- require("dapui").close()
	-- require("dapui").toggle()

	f = {
		name = "Find",
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
		f = { "<cmd>Telescope find_files<CR>", "Find files" },
		t = { "<cmd>Telescope live_grep<CR>", "Find Text" },
		s = { "<cmd>Telescope grep_string<CR>", "Find String" },
		h = { "<cmd>Telescope help_tags<CR>", "Help" },
		H = { "<cmd>Telescope highlights<CR>", "Highlights" },
		i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<CR>", "Media" },
		l = { "<cmd>Telescope resume<CR>", "Last Search" },
		M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<CR>", "Recent File" },
		R = { "<cmd>Telescope registers<CR>", "Registers" },
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
		C = { "<cmd>Telescope commands<CR>", "Commands" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
		l = { "<cmd>GitBlameToggle<CR>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<CR>",
			"Diff",
		},
		G = {
			name = "Gist",
			a = { "<cmd>Gist -b -a<CR>", "Create Anon" },
			d = { "<cmd>Gist -d<CR>", "Delete" },
			f = { "<cmd>Gist -f<CR>", "Fork" },
			g = { "<cmd>Gist -b<CR>", "Create" },
			l = { "<cmd>Gist -l<CR>", "List" },
			p = { "<cmd>Gist -b -p<CR>", "Create Private" },
		},
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		c = { "<cmd>lua require('user.lsp').server_capabilities()<CR>", "Get Capabilities" },
		d = { "<cmd>TroubleToggle<CR>", "Diagnostics" },
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<CR>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
		F = { "<cmd>LspToggleAutoFormat<CR>", "Toggle Autoformat" },
		i = { "<cmd>LspInfo<CR>", "Info" },
		h = { "<cmd>lua require('lsp-inlayhints').toggle()<CR>", "Toggle Hints" },
		H = { "<cmd>IlluminationToggle<CR>", "Toggle Doc HL" },
		I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>",
			"Prev Diagnostic",
		},
		v = { "<cmd>lua require('lsp_lines').toggle()<CR>", "Virtual Text" },
		l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
		o = { "<cmd>SymbolsOutline<CR>", "Outline" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		R = { "<cmd>TroubleToggle lsp_references<CR>", "References" },
		s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
			"Workspace Symbols",
		},
		t = { '<cmd>lua require("user.functions").toggle_diagnostics()<CR>', "Toggle Diagnostics" },
		u = { "<cmd>LuaSnipUnlinkCurrent<CR>", "Unlink Snippet" },
	},

	s = {
		name = "Surround",
	},

	S = {
		name = "Session",
		s = { "<cmd>SaveSession<CR>", "Save" },
		r = { "<cmd>RestoreSession<CR>", "Restore" },
		x = { "<cmd>DeleteSession<CR>", "Delete" },
		f = { "<cmd>Autosession search<CR>", "Find" },
		d = { "<cmd>Autosession delete<CR>", "Find Delete" },
		-- a = { ":SaveSession<CR>", "test" },
		-- a = { ":RestoreSession<CR>", "test" },
		-- a = { ":RestoreSessionFromFile<CR>", "test" },
		-- a = { ":DeleteSession<CR>", "test" },
	},

	R = {
		-- name = "Session",
		-- s = { "<cmd>SaveSession<CR>", "Save" },
		-- l = { "<cmd>LoadLastSession!<CR>", "Load Last" },
		-- d = { "<cmd>LoadCurrentDirSession!<CR>", "Load Last Dir" },
		-- f = { "<cmd>Telescope sessions save_current=false<CR>", "Find Session" },
		name = "SnipRun",
		c = { "<cmd>SnipClose<CR>", "Close" },
		f = { "<cmd>%SnipRun<CR>", "Run File" },
		i = { "<cmd>SnipInfo<CR>", "Info" },
		m = { "<cmd>SnipReplMemoryClean<CR>", "Mem Clean" },
		r = { "<cmd>SnipReset<CR>", "Reset" },
		t = { "<cmd>SnipRunToggle<CR>", "Toggle" },
		x = { "<cmd>SnipTerminate<CR>", "Terminate" },
	},

	t = {
		name = "Terminal",
		["1"] = { ":1ToggleTerm<CR>", "1" },
		["2"] = { ":2ToggleTerm<CR>", "2" },
		["3"] = { ":3ToggleTerm<CR>", "3" },
		["4"] = { ":4ToggleTerm<CR>", "4" },
		n = { "<cmd>lua _NODE_TOGGLE()<CR>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<CR>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<CR>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<CR>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<CR>", "Vertical" },
	},

	T = {
		name = "Treesitter",
		h = { "<cmd>TSHighlightCapturesUnderCursor<CR>", "Highlight" },
		p = { "<cmd>TSPlaygroundToggle<CR>", "Playground" },
		r = { "<cmd>TSToggle rainbow<CR>", "Rainbow" },
	},

	-- z = {
	--   name = "Zen",
	--   z = { "<cmd>TZAtaraxis<CR>", "Zen" },
	--   m = { "<cmd>TZMinimalist<CR>", "Minimal" },
	--   n = { "<cmd>TZNarrow<CR>", "Narrow" },
	--   f = { "<cmd>TZFocus<CR>", "Focus" },
	-- },
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },
	s = { "<esc><cmd>'<,'>SnipRun<CR>", "Run range" },
	-- z = { "<cmd>TZNarrow<CR>", "Narrow" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(m_mappings, m_opts)
