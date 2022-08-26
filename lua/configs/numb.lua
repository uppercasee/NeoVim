local status_ok, numb = pcall(require, "numb")
if not status_ok then
	vim.notify("[WARNING] numb module not found. numb support disabled.", vim.log.levels.WARN, {title = 'Nvim-config'})
	return
end
numb.setup({
	show_numbers = true, -- Enable 'number' for the window while peeking
	show_cursorline = true, -- Enable 'cursorline' for the window while peeking
})
