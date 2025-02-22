return {
    "nvim-tree/nvim-tree.lua",
    opts = {
        filters = {
            dotfiles = true,
            custom = { ".git" },
        },
        view = {
            adaptive_size = true,
            number = true,
            relativenumber = true,
        },
    },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer"},
    },
}
