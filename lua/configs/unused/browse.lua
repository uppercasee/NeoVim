local status_ok, browse = pcall(require, "browse")
if not status_ok then
	vim.notify(
		"[WARNING] browse module not found. browse support disabled.",
		vim.log.levels.WARN,
		{ title = "Nvim-config" }
	)
	return
end

browse.setup({
	provider = "brave",
})

local bookmarks = {
	"https://www.chrisatmachine.com/",
	"https://github.com/christianchiarulli",
	"https://github.com/rockerBOO/awesome-neovim",
	"https://signin.aws.amazon.com/signin",
	"https://doc.rust-lang.org/book/",
	"https://aur.archlinux.org/packages/",
	"https://news.ycombinator.com/",
	-- "https://github.com/neovim/neovim",
	-- "https://neovim.discourse.group/",
}

local function command(name, rhs, opts)
	opts = opts or {}
	vim.api.nvim_create_user_command(name, rhs, opts)
end

command("BrowseInputSearch", function()
	browse.input_search()
end, {})

command("Browse", function()
	browse.browse({ bookmarks = bookmarks })
end, {})

command("BrowseBookmarks", function()
	browse.open_bookmarks({ bookmarks = bookmarks })
end, {})

command("BrowseDevdocsSearch", function()
	browse.devdocs.search()
end, {})

command("BrowseDevdocsFiletypeSearch", function()
	browse.devdocs.search_with_filetype()
end, {})

command("BrowseMdnSearch", function()
	browse.mdn.search()
end, {})
