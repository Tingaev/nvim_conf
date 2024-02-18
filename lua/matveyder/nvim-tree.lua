local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
    view = {
        adaptive_size = true,
        number = true,
        relativenumber = true,
    },
    filters = {
        custom = { ".git" },
    },
}

