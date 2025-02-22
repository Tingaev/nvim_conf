return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	keys = { { "<leader>lb", "<cmd>lua require('barbecue.ui').toggle()<CR>", desc = "Barbecue toggle" } },
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
}
