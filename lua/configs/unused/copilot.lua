-- For copilot.vim
-- vim.g.copilot_filetypes = {
--   ["*"] = false,
-- }

-- vim.cmd [[
--   imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
--   let g:copilot_no_tab_map = v:true
-- ]]

local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	vim.notify(
		"[WARNING] Copilot module not found. Copilot support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

copilot.setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
})
-- copilot.setup()
-- copilot.setup({
-- 	cmp = {
-- 		enabled = true,
-- 		method = "getCompletionsCycling",
-- 	},
-- 	panel = { -- no config options yet
-- 		enabled = true,
-- 	},
-- 	ft_disable = { "markdown" },
-- 	-- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
-- 	server_opts_overrides = {
-- 		-- trace = "verbose",
-- 		settings = {
-- 			advanced = {
-- 				-- listCount = 10, -- #completions for panel
-- 				inlineSuggestCount = 3, -- #completions for getCompletions
-- 			},
-- 		},
-- 	},
-- })
