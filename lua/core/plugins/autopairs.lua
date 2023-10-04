return {
    "windwp/nvim-autopairs",
    dependencies = {
        {   "hrsh7th/nvim-cmp",
            optional = true
        }
    },
    event = "InsertEnter",
    opts = {
        check_ts = true,
        ts_config = { },
    },
    config = function(_, opts)
        local autopairs_status, autopairs = pcall(require, 'nvim-autopairs')
        if not autopairs_status then
            return
        end
        autopairs.setup(opts)

        local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
        if not cmp_autopairs_setup then
            return
        end

        local cmp_setup, cmp = pcall(require, "cmp")
        if not cmp_setup then
            return
        end

        -- make autopairs and completion work together
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
}
