return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd([[colorscheme kanagawa]])
        end,
    },
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
