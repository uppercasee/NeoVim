return {
	"okuuva/auto-save.nvim", -- Working fork of Pocco81/auto-save.nvim
	cmd = "ASToggle", -- optional for lazy loading on command
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		trigger_events = { -- See :h events
			immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
			defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
			cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
		},
		condition = function(buf)
			local fn = vim.fn
			local utils = require("auto-save.utils.data")
			if
				fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon" })
			then
				return true
			end
			return false
		end,
	},
}
