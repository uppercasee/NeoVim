local status_ok_lz, lsp_zero = pcall(require, "lsp-zero")
if not status_ok_lz then
	vim.notify( "[WARNING] lsp-zero module not found. lsp-zero support disabled.", vim.log.levels.WARN, { title = "Nvim-config" })
	return
end

local status_ok_lc, lspconfig = pcall(require, "lspconfig")
if not status_ok_lc then
	vim.notify("[WARNING] lspconfig module not found. lspconfig support disabled.", vim.log.levels.WARN, { title = "Nvim-config" })
	return
end

local status_ok_mason, mason = pcall(require, "mason")
if not status_ok_mason then
	vim.notify("[WARNING] mason module not found. mason support disabled.", vim.log.levels.WARN, {title = 'Nvim-LSP'})
  return
end

local status_ok_mlsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mlsp then
	vim.notify("[WARNING] mason-lspconfig module not found. mason-lspconfig support disabled.", vim.log.levels.WARN, {title = 'Nvim-LSP'})
  return
end

local cmp_status_ok_cmp, cmp = pcall(require, "cmp")
if not cmp_status_ok_cmp then
	vim.notify("[WARNING] cmp module not found. Completion support disabled.", vim.log.levels.WARN, { title = "Nvim-config" })
	return
end

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
  end
)

local servers = {
    "bashls",
    "clangd",
    "cssls",
    "cssmodules_ls",
    "dockerls",
    "eslint",
    "html",
    "jsonls",
    "jdtls",
    "tsserver",
    "ltex",
    "texlab",
    "lua_ls",
    "marksman",
    "powershell_es",
    "pyright",
    "rust_analyzer",
    "tailwindcss",
    "lemminx",
    "yamlls"
}

--- if you want to know more about lsp-zero and mason.nvim
--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
mason.setup({})

mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
        tsserver = function()
          lspconfig.tsserver.setup({
            single_file_support = false,
            on_attach = function(client, bufnr)
              print('hello tsserver')
            end
          })
        end,
      }
})

lsp_zero.set_server_config({
    on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end,
  })

local cmp_format = lsp_zero.cmp_format()

cmp.setup({
  formatting = cmp_format,
})

-- other servers
  -- "asm_lsp",
  -- "csharp_ls",
  -- "neocmake",
  -- "htmx",
  -- "r_language_server",
  -- "sqlls",