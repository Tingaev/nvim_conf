function string.starts(String, Start)
	return string.sub(String, 1, string.len(Start)) == Start
end

local tickets_to_dir_map = {
    -- 'LI-' = '/ "work" / "iponweb" / "liveintent" / "tickets" /',
}

function dir_auto_picker(spec)
	local path = spec.dir / tostring(spec.id)
	if spec.title then
		if string.starts(spec.title, "LI-") then
			path = spec.dir / "work" / "iponweb" / "liveintent" / "tickets" / spec.title
		end
	end
	return path:with_suffix ".md"
end

return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/notes",
			},
		},
		new_notes_location = "notes_subdir",
		templates = {
			folder = "templates",
		},
		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			default_tags = { "daily-notes" },
			template = "daily",
		},
		ui = {
			enable = false,
		},
		note_path_func = dir_auto_picker,
	},
	keys = {
		{ "<leader>oT", "<cmd>ObsidianTemplate<CR>", desc = "Insert Obsidian Template" },
		{ "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Show ObsidianBacklinks" },
		{ "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "Show ObsidianLinks" },
		{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Create New Note" },
		{ "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search Obsidian" },
		{ "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
		{ "<leader>od", "<cmd>ObsidianDailies<CR>", desc = "Dayli Notes" },
		{ "<leader>ot", "<cmd>ObsidianTags<CR>", desc = "Dayli Notes" },
	},
}
