function string.starts(String, Start)
	return string.sub(String, 1, string.len(Start)) == Start
end


local prefix_paths = {
	["LI-"] = {
		path = { "work", "iponweb", "liveintent", "tickets" },
		full_prefix = "LI-",
	},
	["DY-"] = {
		path = { "work", "iponweb", "dac-yieldone", "tickets" },
		full_prefix = "DAC-YIELDONE-",
	},
	["D-"] = {
		path = { "work", "iponweb", "dove", "tickets" },
		full_prefix = "DOVE-",
	},
}

function dir_auto_picker(spec)
	local path = spec.dir / tostring(spec.id)

	if spec.title then
		for prefix, config in pairs(prefix_paths) do
			if string.starts(spec.title, prefix) then
				path = spec.dir
				for _, part in ipairs(config.path) do
					path = path / part
				end

				local title = config.full_prefix .. string.sub(spec.title, #prefix + 1)
				path = path / title
				break
			end
		end
	end

	return path:with_suffix(".md")
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
