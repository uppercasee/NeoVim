local status_ok, scope = pcall(require, "scope")
if not status_ok then
	vim.notify("[WARNING] scope module not found. scope support disabled.", vim.log.levels.WARN, {title = 'Nvim-config'})
	return
end

scope.setup()
