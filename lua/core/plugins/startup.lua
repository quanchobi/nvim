return {
    "startup-nvim/startup.nvim",
    opts = { theme = "dashboard" },
    config = function(_, opts)
        local startup = require("startup")
        startup.setup(opts)
    end,
    dependencies = {
        { "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim" }
    },
}
