local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup {
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  background = { dark = "mocha" } 
}

-- vim.schedule(function () vim.cmd([[colorscheme catppuccin]]) end)

vim.cmd([[
  try
    -- colorscheme catppuccin-macchiato
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])