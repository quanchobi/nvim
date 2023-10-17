return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,
        ts_config = { },
    },
    config = function(_, opts)
        local autopairs = require("nvim-autopairs")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        -- Call setup function
        autopairs.setup(opts)

        -- make autopairs and completion work together
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
    dependencies = {
        {   "hrsh7th/nvim-cmp",
            optional = true
        }
    },
}
