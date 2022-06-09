local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok, handlers = pcall(require, "lsp.handlers")
if not status_ok then
  return
end

require("lsp.installer")
require("lsp.lspsaga")
require("lsp.null-ls")
handlers.setup()

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "clangd" }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
