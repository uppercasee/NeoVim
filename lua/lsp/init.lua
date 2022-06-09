-- local status_ok, lspconfig = pcall(require, "lspconfig")
-- if not status_ok then
--   return
-- end

-- require("lsp.lsp-installer")
-- require("lsp.handlers").setup()
-- require("lsp.lspsaga")
-- require("lsp.null-ls")

-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright' }
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
--     -- on_attach = my_custom_on_attach,
--   }))
-- end
local M = {}

local servers = {
  gopls = {},
  html = {},
  jsonls = {},
  pyright = {},
  rust_analyzer = {},
  sumneko_lua = {},
  tsserver = {},
  vimls = {},
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("lsp.keymaps").setup(client, bufnr)
end

local opts = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

function M.setup()
  require("lsp.installer").setup(servers, opts)
end

return M