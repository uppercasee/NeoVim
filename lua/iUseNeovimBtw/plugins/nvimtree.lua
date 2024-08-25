local icons = require("iUseNeovimBtw.icons")

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
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
				custom = { ".git" },
				exclude = { ".gitignore" },
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

-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	version = "*",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- 	cmd = "Neotree",
-- 	keys = {
-- 		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal" },
-- 	},
-- 	opts = {
-- 		icon = {
-- 			folder_closed = "",
-- 			folder_open = "",
-- 			folder_empty = "󰜌",
-- 			-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
-- 			-- then these will never be used.
-- 			default = "*",
-- 			highlight = "NeoTreeFileIcon",
-- 		},
-- 		modified = {
-- 			symbol = "[✚]",
-- 			highlight = "NeoTreeModified",
-- 		},
-- 		name = {
-- 			trailing_slash = false,
-- 			use_git_status_colors = true,
-- 			highlight = "NeoTreeFileName",
-- 		},
-- 		git_status = {
-- 			symbols = {
--                              deleted="",
--                              renamed="凜",
--                              untracked="",
--                              ignored="",
--                              unstaged="",
--                              staged="",
--                              conflict="",
-- 			},
-- 		},
-- 		filesystem = {
-- 			window = {
-- 				mappings = {
-- 					["\\"] = "close_window",
-- 				},
-- 			},
-- 		},
-- 	},
-- }

-- (setup :neo-tree
--        {:use_popups_for_input true
--         :popup_border_style :solid
--         :window {:position :left :width 25}
--         :filesystem {:use_libuv_file_watcher true}
--         :default_component_configs {:indent {:with_markers false}
