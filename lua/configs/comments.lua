local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	vim.notify(
		"[WARNING] Comment module not found. Comment support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

local status_ok_1, _ = pcall(require, "lsp-inlayhints")
if not status_ok_1 then
	vim.notify(
		"[WARNING] lsp_inlayhints module not found. Comment support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

local status_ok_2, _ = pcall(require, "ts_context_commentstring")
if not status_ok_2 then
	vim.notify(
		"[WARNING] ts_context_commentstring module not found. Comment support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

comment.setup({
	ignore = "^$",
	pre_hook = function(ctx)
		-- For inlay hints
		local line_start = (ctx.srow or ctx.range.srow) - 1
		local line_end = ctx.erow or ctx.range.erow
		require("lsp-inlayhints.core").clear(0, line_start, line_end)

		require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()

		if vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript" then
			local U = require("Comment.utils")

			-- Determine whether to use linewise or blockwise commentstring
			local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

			-- Determine the location where to calculate commentstring from
			local location = nil
			if ctx.ctype == U.ctype.blockwise then
				location = require("ts_context_commentstring.utils").get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = require("ts_context_commentstring.utils").get_visual_start_location()
			end

			return require("ts_context_commentstring.internal").calculate_commentstring({
				key = type,
				location = location,
			})
		end
	end,
})
