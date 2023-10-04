return {
    {   "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "TSUpdateSync" },
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>", desc = "Decrement selection", mode = "x" }
        },
        opts = {
            highlight = {
                enable = true,
                additional_vim_regex_highlightings = false
            },
            indent = { enable = true },
            auto_install = true,
        },
        config = function(_, opts)
            local status, ts = pcall(require, "nvim-treesitter.configs")
            if not status then
                return
            end
            ts.setup(opts)
        end
    } -- end treesitter
}
