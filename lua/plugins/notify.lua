return {
    "rcarriga/nvim-notify",
    opts={},
    lazy=false,
    config = function(LazyPlugin, _)
        -- vim.notify = LazyPlugin
        vim.notify = require("notify")
    end
}
