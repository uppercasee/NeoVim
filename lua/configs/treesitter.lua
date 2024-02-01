local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify(
		"[WARNING] treesitter.config module not found. treesitter support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

configs.setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
	auto_install = true,
})