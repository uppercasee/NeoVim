local transparent, cmp = pcall(require, "transparent")
if not transparent then
	vim.notify(
		"[WARNING] transparent module not found. transparent support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

transparent.setup({
	enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups

		-- example of akinsho/nvim-bufferline.lua
		"BufferLineTabClose",
		"BufferlineBufferSelected",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",
	},
	exclude = {}, -- table: groups you don't want to clear
})
