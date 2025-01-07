return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
  lazy = true,
	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "slant",
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or ""
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
			},
		})
	end,
}
