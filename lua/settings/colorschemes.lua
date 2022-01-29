local status_ok, monokai = pcall(require, "monokai")
if not status_ok then
	return
end

monokai.setup{}


vim.cmd [[
try
  colorscheme monokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
