-- local treesitter = require "nvim-treesitter"

local M = {}

M.setup = function()
  local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })

  require("nvim-treesitter").setup {
    -- A list of parser names, or "all"
    -- ensure_installed = {
    --     "vimdoc", "javascript", "typescript", "c", "lua", "rust",
    --     "jsdoc", "bash", "python"
    -- },
    ensure_installed = "all",

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
    auto_install = true,

    indent = {
        enable = true
    },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = { "markdown" },
    },
    indent = { enable = true },
  }

--   vim.api.nvim_create_autocmd("FileType", {
--     group = group,
--     callback = function(args)
--       local bufnr = args.buf
--       local ft = vim.bo[bufnr].filetype
--       pcall(vim.treesitter.start)

--       if syntax_on[ft] then
--         vim.bo[bufnr].syntax = "on"
--       end
--     end,
--   })
end

M.setup()

return M