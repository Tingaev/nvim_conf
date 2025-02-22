local opts = {
  ensure_installed = {
    'c',
    'go',
    'lua',
    'python',
    'perl',
    'vim',
    'vimdoc',
    'query',
    'markdown',
    'markdown_inline',
  },
    incremental_selection = {
        enable = true,
        keymaps = {
            node_incremental = "<C-space>",
            init_selection = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
}

local function config()
  require('nvim-treesitter.configs').setup(opts)
end

return {
  'nvim-treesitter/nvim-treesitter',
  config = config,
  build = ':TSUpdate',
}
