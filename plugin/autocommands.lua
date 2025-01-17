require("nvim-tree").setup()

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("config-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Function to open nvim-tree if a path is provided
local function open_nvim_tree(data)
	local filepath = data.file

	if filepath and vim.fn.isdirectory(filepath) == 1 then
		vim.cmd.cd(filepath)
		require("nvim-tree.api").tree.open()
	end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- removing trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "removing trailing whitespace on save",
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- close on 'q'
vim.api.nvim_create_autocmd("FileType", {
	desc = "Close on q",
	pattern = { "help", "man", "qf", "lspinfo", "startuptime", "checkhealth" },
	command = "nnoremap <buffer> q :close<CR>",
})

-- auto reload file changed outside neovim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	command = "checktime",
})

-- Autocommand to turn on highlight colors
-- vim.api.nvim_create_autocmd("BufReadPost", {
--     callback = function()
--         require("nvim-highlight-colors").turnOn()
--     end,
-- })

-- Show cursor line only in active window
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
	desc = "Show cursor line only in active window",
	callback = function()
		vim.wo.cursorline = true
	end,
})

-- Remove cursor line from inactive window
vim.api.nvim_create_autocmd("WinLeave", {
	desc = "Remove cursor line from inactive windows",
	callback = function()
		vim.wo.cursorline = false
	end,
})

-- Disable relative numbers in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	desc = "Disable relative numbers in insert mode",
	callback = function()
		vim.opt.relativenumber = false
	end,
})

-- Enable relative numbers in insert mode
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	desc = "Enable relative numbers in normal mode",
	callback = function()
		vim.opt.relativenumber = true
	end,
})

-- Highlight line exceeding 80 characters
vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Highlight lines exceeding 80 characters",
	callback = function()
		vim.cmd("match ErrorMsg '\\%81v.+'")
	end,
})
