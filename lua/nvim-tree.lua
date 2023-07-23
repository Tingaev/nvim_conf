local status_ok, nvim_tree = pcall(require, "nvim-tree")
print(status_ok)

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
print(config_status_ok)

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
