local status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

--require('ufo').setup({
--    provider_selector = function(bufnr, filetype, buftype)
--        return {'treesitter', 'indent'}
--    end
--})
-- local tree_setter = require("nvim-treesitter")
-- vim.cmd("TSEnable highlight")

treesitter_config.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "vimdoc", "lua", "go", "python", "perl" },

	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "<C-space>",
			init_selection = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = true,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}
