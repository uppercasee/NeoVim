local icons = require("iUseNeovimBtw.icons")

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = true,
	cmd = "NvimTreeToggle",
	-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
	keys = {
		{
			"<leader>e",
			function()
				require("nvim-tree")
			end,
			mode = "n",
			desc = "[E]xplorer",
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			hijack_directories = {
				enable = false,
			},
			-- update_to_buf_dir = {
			--   enable = false,
			-- },
			-- disable_netrw = true,
			-- hijack_netrw = true,
			-- open_on_setup = true,
			-- ignore_ft_on_setup = {
			-- 	"startify",
			-- 	"dashboard",
			-- 	"alpha",
			-- },
			filters = {
				dotfiles = true,
				git_ignored = false,
				custom = { "^.git$" },
				-- exclude = { ".gitignore" },
			},
			-- auto_close = true,
			-- open_on_tab = false,
			-- hijack_cursor = false,
			update_cwd = true,
			-- update_to_buf_dir = {
			--   enable = true,
			--   auto_open = true,
			-- },
			-- --   error
			-- --   info
			-- --   question
			-- --   warning
			-- --   lightbulb
			renderer = {
				add_trailing = false,
				group_empty = false,
				highlight_git = false,
				highlight_opened_files = "none",
				root_folder_modifier = ":t",
				indent_markers = {
					enable = false,
					icons = {
						corner = "└ ",
						edge = "│ ",
						none = "  ",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = icons.ui.ArrowOpen,
							arrow_closed = icons.ui.ArrowClosed,
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				icons = {
					hint = icons.diagnostics.Hint,
					info = icons.diagnostics.Information,
					warning = icons.diagnostics.Warning,
					error = icons.diagnostics.Error,
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
				ignore_list = {},
			},
			-- system_open = {
			--   cmd = nil,
			--   args = {},
			-- },
			-- filters = {
			--   dotfiles = false,
			--   custom = {},
			-- },
			git = {
        enable = true,
				ignore = true,
				timeout = 500,
			},
			-- view = {
			-- 	width = 30,
			-- 	height = 30,
			-- 	hide_root_folder = false,
			-- 	side = "left",
			-- 	-- auto_resize = true,
			-- 	mappings = {
			-- 		custom_only = false,
			-- 		list = {
			-- 			-- { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
			-- 			-- { key = "h", cb = tree_cb("close_node") },
			-- 			-- { key = "v", cb = tree_cb("vsplit") },
			-- 		},
			-- 	},
			--  number = false,
			-- 	relativenumber = false,
			-- },
		})
	end,
}
