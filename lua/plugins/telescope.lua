-- TODO: maybe it should be in return
local telescopeConfig = require "telescope.config"
local builtin = require "telescope.builtin"
local actions = require "telescope.actions"

local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	},
	keys = {
		{ "<leader>b", builtin.buffers, desc = "Find Buffers" },
		{ "<leader>f", builtin.find_files, desc = "Find Files" },
		{
			"<leader>F",
			"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			desc = "Live Grep",
		},
		{ "<leader>sw", builtin.grep_string, desc = "Find Word under Cursor" },
		{ "<leader>sc", builtin.colorscheme, desc = "Pick colorscheme" },
		{ "<leader>sj", builtin.jumplist, desc = "Jump list" },
		{ "<leader>sh", builtin.help_tags, desc = "Find Help Tags" },
		{ "<leader>sf", builtin.git_bcommits, desc = "Find Help Tags" },
		{ "<leader>sn", "<cmd>Telescope notify<CR>", desc = "Notifications" },
	},
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "absolute" },
			vimgrep_arguments = vimgrep_arguments,
			mappings = {
				n = {
					["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
				},
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-c>"] = actions.close,
					["<C-o>"] = actions.select_drop,
					["<C-k>"] = actions.move_selection_previous,
					["<C-p>"] = actions.cycle_history_next,
					["<C-n>"] = actions.cycle_history_prev,
					["<C-a>"] = actions.add_selected_to_qflist + actions.open_qflist,
					["<C-q>"] = actions.delete_buffer,
					["<C-w>"] = actions.send_to_qflist + actions.open_qflist,
					["<C-S-d>"] = actions.delete_buffer,
				},
			},
		},
		pickers = {
			find_files = {
				-- TODO: think about it
				-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
				find_command = { "rg", "--files", "--glob", "!**/.git/*" },
			},
		},
		planets = {
			show_pluto = true,
		},
	},
}
