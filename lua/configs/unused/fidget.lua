local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
	vim.notify(
		"[WARNING] Fidget module not found. Fidget support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

fidget.setup()
