local status_ok, presence = pcall(require, "presence")
if not status_ok then
	return
end

presence:setup{
	-- General options
	auto_update         = true,
	neovim_image_text   = "NeoVim",
	main_image          = "neovim",
	-- client_id           = " ", -- not recommended
	log_level           = nil,
	debounce_timeout    = 10,
	enable_line_number  = false,
	blacklist           = {},
	buttons             = false,
	
	-- Rich Presence text options
	-- editing_text        = "Editing %s",
	-- file_explorer_text  = "Browsing %s",
	-- git_commit_text     = "Committing changes",
	-- plugin_manager_text = "Managing plugins",
	-- reading_text        = "Reading %s",
	-- workspace_text      = "%s",
	-- line_number_text    = "Line %s out of %s",
}
