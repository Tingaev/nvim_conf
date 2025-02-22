return {
	"neovim/nvim-lspconfig",
	lazy = false,
	keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "williamboman/mason-lspconfig.nvim", config = function() end },
	},
	config = function(_, opts)
		require("mason-lspconfig").setup {
			ensure_installed = { "pylsp", "gopls", "lua_ls" },
		}
		require("mason-lspconfig").setup_handlers {
			function(server_name)
				require("lspconfig")[server_name].setup {}
			end,
		}
	end,
}
