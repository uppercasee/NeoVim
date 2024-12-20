local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "[A]dd file to Harpoon list" })
vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, { desc = "[R]emove file from Harpoon list" })
vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon [m]enu" })

vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Select [1] first Harpoon item" })
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Select [2] second Harpoon item" })
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Select [3] third Harpoon item" })
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Select [4] fourth Harpoon item" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-Tab>", function() harpoon:list():next() end, { desc = "Next Harpoon buffer" })
vim.keymap.set("n", "<C-S-Tab>", function() harpoon:list():prev() end, { desc = "Previous Harpoon buffer" })

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>hs", function() toggle_telescope(harpoon:list()) end,
    { desc = "[H]arpoon [S]earch" })
