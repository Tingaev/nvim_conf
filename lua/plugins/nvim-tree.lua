return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		view = {
			adaptive_size = true,
			number = true,
			relativenumber = true,
		},
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
	},
}
