local opts = {
	ensure_installed = {
		"c",
		"go",
		"json",
		"lua",
		"toml",
		"python",
		"perl",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
		"uetlx",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "<C-space>",
			init_selection = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
}

vim.filetype.add {
	filename = {
		["logs.json"] = "uetlx",
		["aggs.json"] = "uetlx",
	},
}

local function config()
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.uetlx = {
		install_info = {
			url = "/home/m.tingaev/Documents/tree-sitter-uetlx",
			files = { "src/parser.c" },
		},
		filetype = "uetlx",
	}

	require("nvim-treesitter.configs").setup(opts)
end

return {
	"nvim-treesitter/nvim-treesitter",
	config = config,
	build = ":TSUpdate",
}
