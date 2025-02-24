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
        -- local cmp_action = require("lsp-zero").cmp_action()
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          sources = {
            { name = "nvim_lsp" },
            { name = "luasnip", keyword_length = 2 },
            { name = "buffer", keyword_length = 3 },
            { name = "path" },
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
            -- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
            -- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
            -- ["<Tab>"] = cmp_action.luasnip_supertab(),
            -- ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
          }),
        })

        -- vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
        -- vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
        -- vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
        -- vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
	end,
}
