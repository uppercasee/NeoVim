-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not status_ok then
-- 	return
-- end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
-- 	local opts = {
-- 		on_attach = require("lsp.handlers").on_attach,
-- 		capabilities = require("lsp.handlers").capabilities,
-- 	}
	
-- 	if server.name == "pyright" then
-- 		local pyright_opts = require("lsp.setups.pyright")
-- 		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
-- 	end

-- 	-- This setup() function is exactly the same as lspconfig's setup function.
-- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)

-- lsp_installer.setup({
-- 	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
--     ui = {
--         icons = {
--             server_installed = "✓",
--             server_pending = "➜",
--             server_uninstalled = "✗"
--         }
--     }
-- })

local status_ok, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")
if not status_ok then
	return
end

local utils = require "utils"

local M = {}

function M.setup(servers, options)
  for server_name, _ in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)

    if server_available then
      server:on_ready(function()
        local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})
        server:setup(opts)
      end)

      if not server:is_installed() then
        utils.info("Installing " .. server.name)
        server:install()
      end
    else
      utils.error(server)
    end
  end
end

return M
