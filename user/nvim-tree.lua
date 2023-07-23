require("nvim-tree").setup {
    view = {
        adaptive_size = true,
        number = true,
        relativenumber = true,
    },
    filters = {
        custom = { ".git" },
    },
}

