local status_ok, eyeliner = pcall(require, "eyeliner")
if not status_ok then
	vim.notify("[WARNING] Eyeliner module not found. Eyeliner support disabled.", vim.log.levels.WARN, {title = 'Nvim-config'})
	return
end

eyeliner.setup({
	highlight_on_key = true,
})
