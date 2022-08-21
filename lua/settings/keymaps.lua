local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- MODES --
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NORMAL --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Toggle transparent background
-- keymap("n", "tr", ":TransparentToggle<CR>", opts)

-- INSERT --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- VISUAL --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)


-- VISUAL BLOCK --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- TERMINAL --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- FROM PLUGINS -- 
-- BufferDelete
keymap("n", "<Leader>w", ":Bdelete<CR>", opts)

-- NvimTreeToggle
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", opts)

-- Toggle Term 
keymap("n", "<leader>\\", ":ToggleTerm<CR>", opts)

-- Telescope
keymap("n", "<leader>gt", "<cmd>Telescope git_status<CR>", opts)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

-- Trouble
keymap("n", "<leader>`", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- EVERYTHING WITH LSP --

-- LSP SAGA
keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "rn", "<cmd>Lspsaga rename<CR>", opts)
keymap("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
keymap("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)

-- SYMBOLS OUTLINE
keymap("n", "<leader>s", "<cmd>SymbolsOutline<CR>", opts)

-- FORMATTING
keymap("n", "<Leader>r", ":lua vim.lsp.buf.formatting_sync()", opts)
