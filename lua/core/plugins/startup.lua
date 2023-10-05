return {
    "startup-nvim/startup.nvim",
    dependencies = {
        { "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim" }
    },
    opts = { theme = "dashboard" },
    config = function(_, opts)
        local startup = require("startup")
        startup.setup(opts)
    end
}
