local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	vim.notify("[WARNING] Aerial module not found. Aerial support disabled.", vim.log.levels.WARN, {title = 'Nvim-config'})
	return
end

aerial.setup()
