M = {}
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("[WARNING] lspconfig module not found. lspconfig support disabled.", vim.log.levels.WARN, {title = 'Nvim-LSP'})
	return
end

M.server_capabilities = function()
	local active_clients = vim.lsp.get_active_clients()
	local active_client_map = {}

	for index, value in ipairs(active_clients) do
		active_client_map[value.name] = index
	end

	vim.ui.select(vim.tbl_keys(active_client_map), {
		prompt = "Select client:",
		format_item = function(item)
			return "capabilites for: " .. item
		end,
	}, function(choice)
		-- print(active_client_map[choice])
		print(
			vim.inspect(
				vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities.executeCommandProvider
			)
		)
		vim.pretty_print(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities)
	end)
end

require("lsp.lsp-signature")
-- require "lsp.lsp-installer"
require("lsp.mason")
require("lsp.handlers").setup()
require("lsp.null-ls")

local l_status_ok, lsp_lines = pcall(require, "lsp_lines")
if not l_status_ok then
	vim.notify("[WARNING] lsp_lines module not found. lsp_lines support disabled.", vim.log.levels.WARN, {title = 'Nvim-LSP'})
	return
end

local status_ok, hints = pcall(require, "lsp-inlayhints")
if not status_ok then
	vim.notify("[WARNING] lsp-inlayhints module not found. lsp-inlayhints support disabled.", vim.log.levels.WARN, {title = 'Nvim-LSP'})
	return
end

hints.on_attach(client, bufnr)
-- For >0.8, you can use the LspAttach event:
-- vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = "LspAttach_inlayhints",
-- 	callback = function(args)
-- 	  if not (args.data and args.data.client_id) then
-- 		return
-- 	  end

-- 	  local bufnr = args.buf
-- 	  local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 	  hints.on_attach(client, bufnr)
-- 	end,
--   })

lsp_lines.setup()

return M
