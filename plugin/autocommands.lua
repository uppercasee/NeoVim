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
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- close on 'q'
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "man", "qf", "lspinfo", "startuptime", "checkhealth" },
	command = "nnoremap <buffer> q :close<CR>",
})

-- auto reload file changed outside neovim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	command = "checktime",
})

-- Autocommand to turn on highlight colors
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        require("nvim-highlight-colors").turnOn()
    end,
})
