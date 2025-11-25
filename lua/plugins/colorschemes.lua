local colorscheme = "kanagawa"

local colorschemes = {
	{ "rebelot/kanagawa.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "rose-pine/neovim" },
	{ "marko-cerovac/material.nvim" },
	{ "sainnhe/sonokai" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "andersevenrud/nordic.nvim" },
	{ "projekt0n/github-nvim-theme" },
	{ "EdenEast/nightfox.nvim" },
}

for i, cs in ipairs(colorschemes) do
	if string.find(cs[1], colorscheme, 1, true) then
		colorschemes[i].lazy = false
		colorschemes[i].priority = 1000
		colorschemes[i].config = function()
			vim.cmd("colorscheme " .. colorscheme)
		end
	end
end

return colorschemes
