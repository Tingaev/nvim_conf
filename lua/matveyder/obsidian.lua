local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
	return
end

function string.starts(String, Start)
	return string.sub(String, 1, string.len(Start)) == Start
end
vim.notify = require "notify"

---@param spec { id: string, dir: obsidian.Path, title: string|? }
---@return string|obsidian.Path The full path to the new note.
function dir_auto_picker(spec)
	vim.notify(spec.title, "error")

	local path = spec.dir / tostring(spec.id)
	if spec.title then
		if string.starts(spec.title, "LI-") then
			path = spec.dir / "work" / "iponweb" / "liveintent" / "tickets" / spec.title
		end
	end
	return path:with_suffix ".md"
end

obsidian.setup {
	workspaces = {
		{
			name = "personal",
			path = "~/Documents/notes",
		},
	},
	new_notes_location = "notes_subdir",
	notes_subdir = "notes_unsort",
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
		enable = false, -- set to false to disable all additional syntax features
	},
	note_path_func = dir_auto_picker,
	-- Default function for id
	note_id_func = function(title)
		local suffix = ""
		if title ~= nil then
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.time()) .. "-" .. suffix
	end,
}
