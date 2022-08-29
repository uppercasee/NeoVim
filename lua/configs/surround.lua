local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
	vim.notify(
		"[WARNING] surround module not found. surround support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

surround.setup({
	keymaps = {
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "ys",
		normal_cur = "yss",
		normal_line = "yS",
		normal_cur_line = "ySS",
		visual = "S",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
	},
})

-- local status_ok, surround = pcall(require, "surround")
-- if not status_ok then
-- 	vim.notify(
-- 		"[WARNING] surround module not found. surround support disabled.",
-- 		vim.log.levels.WARN,
-- 		{ title = "Nvim-config" }
-- 	)
-- 	return
-- end

-- surround.setup{
--   mappings_style = "sandwich"
-- }
