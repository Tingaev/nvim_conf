local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 30, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	win = {
		-- don't allow the popup to overlap with the cursor
		no_overlap = true,
		padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
		title = true,
		title_pos = "center",
		zindex = 1000,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = {
		{ "<auto>", mode = "nxsot" },
	},
}

which_key.add {
	-- Harpoon
	{
		"<leader>a",
		"<cmd>lua require('harpoon.mark').add_file()<cr>",
		desc = "Harpoon: add file",
		nowait = true,
		remap = false,
	},
	-- Packer
	{ "<leader>p", group = "Packer", nowait = true, remap = false },
	{ "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status", nowait = true, remap = false },
	{ "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile", nowait = true, remap = false },
	{ "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install", nowait = true, remap = false },
	{ "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync", nowait = true, remap = false },
	{ "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update", nowait = true, remap = false },
	-- Other
	{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
	{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", nowait = true, remap = false },
	{ "<leader>c", "<cmd>bdelete!<CR>", desc = "Close Buffer", nowait = true, remap = false },
	{ "<leader>q", "<cmd>q!<CR>", desc = "Quit", nowait = true, remap = false },
	{ "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
	-- Other not must have
	{ "<leader>l", group = "Other", nowait = true, remap = false },
	{ "<leader>ll", "<cmd>Hardtime toggle<cr>", desc = "HARDTIME", nowait = true, remap = false },
	{ "<leader>ln", "<cmd>set number norelativenumber<cr>", desc = "Relative number", nowait = true, remap = false },
	{ "<leader>lr", "<cmd>set number relativenumber<cr>", desc = "Relative number", nowait = true, remap = false },
	{ "<leader>lz", "<cmd>ZenMode<cr>", desc = "Zen mode", nowait = true, remap = false },
	-- Obsidian
	{ "<leader>ot", "<cmd>ObsidianTemplate<CR>", desc = "Insert Obsidian Template", nowait = true, remap = false },
	{ "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Show ObsidianBacklinks", nowait = true, remap = false },
	{ "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "Show ObsidianLinks", nowait = true, remap = false },
	{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Create New Note", nowait = true, remap = false },
	{ "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search Obsidian", nowait = true, remap = false },
	{ "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch", nowait = true, remap = false },
	{ "<leader>od", "<cmd>ObsidianDailies<CR>", desc = "Dayli Notes", nowait = true, remap = false },

	{
		"<leader>oa",
		"<cmd>ObsidianNewFromTemplate work/iponweb/liveintent/tickets/LI-1.md<CR>",
		desc = "Dayli Notes",
		nowait = true,
		remap = false,
	},
	-- TODO: move from telescope.lua
	-- :ObsidianNewFromTemplate [PATH] [TEMPLATE]` to create a new note from a
	--     template in the templates folder. Selecting from a list using your preferred
	--         picker. This command has one optional argument: the path to the new note.
}

which_key.setup(setup)
