local sources = {
    -- settings
    "settings.options",
    "settings.plugins",
    "settings.colorschemes",
    "settings.keymaps",

    -- -- plugins
    "configs.cmp",
    "configs.telescope",
    "configs.autopairs",
    "configs.gitsigns",
    "configs.nvim-tree",
    "configs.lualine",
    "configs.presence",
    "configs.bufferline",
    "configs.comments",
    "configs.autosave",
    "configs.treesitter",
    "configs.toggleterm",
    "lsp",
  }
  

  for _, source in ipairs(sources) do
    local status_ok, notok = pcall(require, source)
    if not status_ok then
      error("Couldn't load " .. source .. "\n" .. notok)
    end
  end