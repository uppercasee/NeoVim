local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify("[WARNING] telescope module not found. telescope support disabled.", vim.log.levels.WARN, {title = 'Nvim-config'})
	return
end

local h_status_ok, harpoon = pcall(require, "harpoon")
if not h_status_ok then
	vim.notify("[WARNING] harpoon module not found. harpoon support disabled.", vim.log.levels.WARN, {title = 'Nvim-config'})
	return
end
telescope.load_extension("harpoon")
