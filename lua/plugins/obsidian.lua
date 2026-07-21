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
		full_prefix = "DAC_YIELDONE-",
	},
	["D-"] = {
		path = { "work", "iponweb", "dove", "tickets" },
		full_prefix = "DOVE-",
	},
	["F1H-"] = {
		path = { "work", "iponweb", "f1h", "tickets" },
		full_prefix = "F1H-",
	},
}


local function starts_with(str, prefix)
	return str:sub(1, #prefix) == prefix
end

local function id_picker(title)
    return title .. '.md'
end

local function dir_auto_picker(spec)
	local name = tostring(spec.title or spec.id)

	for prefix, config in pairs(prefix_paths) do
		if starts_with(name, prefix) then
			path = spec.dir

			for _, part in ipairs(config.path) do
				path = path / part
			end

			local title = config.full_prefix .. name:sub(#prefix + 1)
			path = path / title
			break
		end
	end

	vim.notify("note path: " .. tostring(path:with_suffix(".md")), vim.log.levels.WARN)

	return path:with_suffix(".md")
end


return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = false,
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
		note_id_func = id_picker,
	},
	keys = {
		{ "<leader>oT", "<cmd>ObsidianTemplate<CR>", desc = "Insert Obsidian Template" },
		{ "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "Show Obsidian backlinks" },
		{ "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "Show ObsidianLinks" },
		{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Create New Note" },
		{ "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search Obsidian" },
		{ "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
		{ "<leader>od", "<cmd>ObsidianDailies<CR>", desc = "Dayli Notes" },
		{ "<leader>ot", "<cmd>ObsidianTags<CR>", desc = "Dayli Notes" },
	},
}
