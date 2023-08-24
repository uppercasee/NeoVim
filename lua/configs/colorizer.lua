local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	vim.notify(
		"[WARNING] Colorizer module not found. Colorizer support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

colorizer.setup()
