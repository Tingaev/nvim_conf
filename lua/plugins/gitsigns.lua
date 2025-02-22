return {
  "lewis6991/gitsigns.nvim",
  -- lazy = true,
  cmd = "Gitsigns",
  keys = {
    { "<leader>lh", "<cmd>lua require('gitsigns').setqflist('all')<CR>", desc = "QFL with hunks" },
  },
  init = function()
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("load_gitsigns", { clear = false }),
      callback = function()
        if package.loaded["gitsigns"] then
          vim.api.nvim_clear_autocmds({ group = "load_gitsigns" })

          return true
        end

        vim.api.nvim_call_function("system", {
          "git -C " .. vim.api.nvim_call_function("expand", { "%:p:h" }) .. " rev-parse",
        })

        if vim.api.nvim_get_vvar("shell_error") ~= 0 then return end

        vim.api.nvim_clear_autocmds({ group = "load_gitsigns" })

        require("lazy").load({ plugins = { "gitsigns.nvim" } })
      end,
    })
  end,
  config = function()
    local updatetime = vim.api.nvim_get_option_value("updatetime", { scope = "global" })

    require("gitsigns").setup({
      signs = { add = { text = "│" }, change = { text = "│" } },
      current_line_blame = true,
      current_line_blame_opts = { delay = updatetime },
      sign_priority = 1,
      update_debounce = updatetime,
      preview_config = { border = "rounded", row = 1, col = 0 },
    })
  end
}
-- return {}
