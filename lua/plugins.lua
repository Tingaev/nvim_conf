local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require('packer').startup(function(use)
    use {"wbthomason/packer.nvim"}
    use {"folke/which-key.nvim"}
    use {"kyazdani42/nvim-web-devicons"}
    use {"kyazdani42/nvim-tree.lua"}
    use {"lukas-reineke/indent-blankline.nvim"}
    use {"folke/tokyonight.nvim"}
    use {"nvim-zh/auto-save.nvim"}
    use {"akinsho/bufferline.nvim"}
    use {"nvim-lualine/lualine.nvim"}
    --use {"nvim-telescope/telescope.nvim"}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "acksld/nvim-neoclip.lua" },
      },
    }
--    use {
--        "acksld/nvim-neoclip.lua",
--        
--        requires = {
--            {'kkharji/sqlite.lua', module = 'sqlite'},
--            {'nvim-telescope/telescope.nvim'},
--    },
--  config = function()
--    require('neoclip').setup()
--  end,
--}
    use {"mbbill/undotree"}
    use {"debugloop/telescope-undo.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {"ggandor/lightspeed.nvim"}
    use {"rebelot/kanagawa.nvim"}
    use {"rose-pine/neovim"}
    use {"ThePrimeagen/harpoon"}
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    use {"windwp/nvim-autopairs"}
    use {'numToStr/Comment.nvim'}
    use {'m4xshen/hardtime.nvim'}
    
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

