require("iUseNeovimBtw.lazy")

vim.notify = require("notify")

-- Disable netrw and its plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set netrw options
vim.g.netrw_browse_split = 0 -- Open files in the same window
vim.g.netrw_banner = 0 -- Disable the banner at the top of netrw
vim.g.netrw_winsize = 25 -- Set netrw window size to 25%
