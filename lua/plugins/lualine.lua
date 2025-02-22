local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { branch },
			lualine_b = {
				mode,
				{ "filename", file_status = true, path = 1 },
			},
			lualine_c = {
				"navic",
				color_correction = nil,
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	},
}
