local status_ok, escape = pcall(require, "better_escape")
if not status_ok then
	vim.notify(
		"[WARNING] Better escape module not found. Better-escape support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

escape.setup({
	mapping = { "jk" }, -- a table with mappings to use
	timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
	clear_empty_lines = false, -- clear line after escaping if there is only whitespace
	keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
	-- example
	-- keys = function()
	--   return vim.fn.col '.' - 2 >= 1 and '<esc>l' or '<esc>'
	-- end,
})
